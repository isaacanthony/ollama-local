# ollama-local
Local ollama setup making an ollama API accessible on your local network. Can run ollama on machine 1 and connect to that ollama instance on machine 2.

## components
- ollama-server: Ollama API serving a local model on localhost:11434.
- ollama-proxy: Nginx proxy forwarding requests from localhost to the ollama-server local-network ip.

## ollama usage (server machine)
- `make ollama-start`: Start the ollama server.
- `make ollama-run model=qwen2.5-coder:7b`: Run a different [model](https://ollama.com/library).
- `make ollama-stop`: Stop the ollama server.

## nginx usage (client machine)
- `make nginx-start ip=192.xxx.xxx.xxx`: Start the nginx proxy. The `ip` param is required.
- `make nginx-stop`: Stop the nginx proxy.
