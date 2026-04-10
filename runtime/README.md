# runtime

This directory holds the operational runtime layer for NOC.

## Intended contents
- `openclaw/` runtime-specific config, wrappers, and launch assets
- `agents/` agent definitions and templates
- `prompts/` observation, recommendation, and action prompts
- `adapters/` integration adapters and workflow connectors
- `schemas/` audit and runtime schemas
- `session-tests/` known-good runtime tests

## Rule
Runtime behavior should implement governance, not redefine it.
