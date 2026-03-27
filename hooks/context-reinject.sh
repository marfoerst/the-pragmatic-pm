#!/bin/bash
# Hook: SessionStart (matcher: "compact")
# Re-injects domain-context.md into Claude's context after compaction
# so personas, metrics, compliance, and industry context are never lost.

DOMAIN_CONTEXT="$CLAUDE_PROJECT_DIR/domain-context.md"

if [ -f "$DOMAIN_CONTEXT" ]; then
  echo "=== DOMAIN CONTEXT (auto-reinjected after compaction) ==="
  cat "$DOMAIN_CONTEXT"
fi

exit 0
