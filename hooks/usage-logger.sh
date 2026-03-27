#!/bin/bash
# Hook: PostToolUse / PostToolUseFailure (matcher: "Skill")
# Logs every PM skill execution to .pm-toolkit-audit.jsonl
# Format: {timestamp, skill, status}

INPUT=$(cat)
SKILL_NAME=$(echo "$INPUT" | jq -r '.tool_input.skill // empty')
EVENT_NAME=$(echo "$INPUT" | jq -r '.hook_event_name // empty')

# Only log pm-* skills
if [ -z "$SKILL_NAME" ]; then
  exit 0
fi

case "$SKILL_NAME" in
  pm-*|scopevisio-pm-toolkit:pm-*)
    ;;
  *)
    exit 0
    ;;
esac

# Determine status from event name
if [ "$EVENT_NAME" = "PostToolUseFailure" ]; then
  STATUS="failed"
else
  STATUS="success"
fi

TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
LOG_FILE="$CLAUDE_PROJECT_DIR/.pm-toolkit-audit.jsonl"

echo "{\"timestamp\":\"$TIMESTAMP\",\"skill\":\"$SKILL_NAME\",\"status\":\"$STATUS\"}" >> "$LOG_FILE"

exit 0
