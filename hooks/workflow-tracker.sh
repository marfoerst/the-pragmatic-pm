#!/bin/bash
# Hook: PostToolUse (matcher: "Skill")
# Tracks multi-step workflow progress so workflows can resume across sessions.
# Writes stage completion to .pm-toolkit-workflow-state.json

INPUT=$(cat)
SKILL_NAME=$(echo "$INPUT" | jq -r '.tool_input.skill // empty')

# Only track workflow skills
case "$SKILL_NAME" in
  pm-workflow-*|scopevisio-pm-toolkit:pm-workflow-*)
    ;;
  *)
    exit 0
    ;;
esac

TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
STATE_FILE="$CLAUDE_PROJECT_DIR/.pm-toolkit-workflow-state.json"

# Initialize state file if it doesn't exist
if [ ! -f "$STATE_FILE" ]; then
  echo '{"workflows":{}}' > "$STATE_FILE"
fi

# Extract base workflow name (strip prefix if fully qualified)
WORKFLOW=$(echo "$SKILL_NAME" | sed 's/^scopevisio-pm-toolkit://' | sed 's/^pm-toolkit://')

# Read current state, update with latest execution
CURRENT=$(cat "$STATE_FILE")
UPDATED=$(echo "$CURRENT" | jq --arg wf "$WORKFLOW" --arg ts "$TIMESTAMP" '
  .workflows[$wf] = {
    "last_executed": $ts,
    "executions": ((.workflows[$wf].executions // 0) + 1)
  }
')

echo "$UPDATED" > "$STATE_FILE"

exit 0
