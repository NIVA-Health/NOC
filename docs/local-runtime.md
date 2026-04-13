# NOC local runtime checkpoint

## Runtime
- Ollama 0.20.6

## Endpoint
- http://127.0.0.1:11434

## Installed models
- qwen2.5:7b
- qwen2.5:3b

## Validation completed
- Runtime installed successfully
- Primary model pulled successfully
- Helper model pulled successfully
- CLI inference successful
- API tags endpoint successful
- `ollama list` successful

## Initial routing
- `qwen2.5:7b` = primary reasoning and operator model
- `qwen2.5:3b` = helper, triage, classification, and summaries model

## Next steps
- Install and configure OpenClaw
- Point OpenClaw to the local Ollama endpoint
- Stand up the first operator agent
- Run one end-to-end prompt through OpenClaw
