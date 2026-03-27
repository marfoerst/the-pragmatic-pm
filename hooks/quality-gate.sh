#!/bin/bash
# Hook: Stop
# Validates PM deliverables follow the 3 core design principles:
#   1. Problem clarity (why before what)
#   2. Leading + lagging metrics
#   3. Explicit non-goals / scope discipline
#
# Only fires when a PM skill was used in the session.
# Reads the transcript to detect PM skill usage and check output quality.

INPUT=$(cat)
TRANSCRIPT_PATH=$(echo "$INPUT" | jq -r '.transcript_path // empty')

# If no transcript available, skip
if [ -z "$TRANSCRIPT_PATH" ] || [ ! -f "$TRANSCRIPT_PATH" ]; then
  exit 0
fi

# Check if any PM skill was invoked in this session
PM_SKILL_USED=$(jq -r '
  [.[] | select(.type == "tool_use" and .tool_name == "Skill") |
   .tool_input.skill // empty] |
  map(select(startswith("pm-"))) |
  length
' "$TRANSCRIPT_PATH" 2>/dev/null)

# If no PM skill was used, skip quality gate
if [ "$PM_SKILL_USED" = "0" ] || [ -z "$PM_SKILL_USED" ]; then
  exit 0
fi

# Extract the last assistant message content for quality checks
LAST_OUTPUT=$(jq -r '
  [.[] | select(.type == "assistant")] | last | .content // empty
' "$TRANSCRIPT_PATH" 2>/dev/null)

if [ -z "$LAST_OUTPUT" ]; then
  exit 0
fi

MISSING=""

# Check 1: Problem clarity — look for problem statement indicators
if ! echo "$LAST_OUTPUT" | grep -qiE "(problem|why|pain point|customer need|user need|job.to.be.done)"; then
  MISSING="${MISSING}- Missing problem clarity: no problem statement or 'why' found\n"
fi

# Check 2: Metrics — look for leading AND lagging indicators
HAS_LEADING=$(echo "$LAST_OUTPUT" | grep -ciE "(leading|input metric|activation|engagement|adoption)")
HAS_LAGGING=$(echo "$LAST_OUTPUT" | grep -ciE "(lagging|outcome|revenue|retention|NRR|churn)")
if [ "$HAS_LEADING" = "0" ] && [ "$HAS_LAGGING" = "0" ]; then
  MISSING="${MISSING}- Missing metrics: no leading or lagging indicators found\n"
fi

# Check 3: Scope discipline — look for non-goals or explicit scope
if ! echo "$LAST_OUTPUT" | grep -qiE "(non.goal|out of scope|not included|explicitly excluded|scope|won.t)"; then
  MISSING="${MISSING}- Missing scope discipline: no non-goals or scope boundaries found\n"
fi

# If issues found, block and report
if [ -n "$MISSING" ]; then
  echo -e "PM Quality Gate: The deliverable may be incomplete.\n${MISSING}Consider adding these before finalizing." >&2
  exit 2
fi

exit 0
