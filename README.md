# ollama-local
Local ollama setup making an ollama API accessible on your local network. Can run ollama on machine 1 and connect to that ollama instance both from machine 1 as well as from a machine 2.

## usage
- `make start`: Start the ollama server.
- `make run model=qwen2.5-coder:7b`: Run a different [model](https://ollama.com/library).
- `make stop`: Stop the ollama server.
