ollama-start:
	@docker run \
		--detach \
		--gpus all \
		--name ollama-server \
		--publish 11434:11434 \
		--volume $(PWD)/.ollama:/root/.ollama \
		ollama/ollama:0.6.8
	@make -s ollama-run model=qwen2.5-coder:7b
	@echo "http://localhost:11434 \n"
	@ifconfig | grep 192  # local ip address

ollama-run:
	@docker exec ollama-server ollama run $(model)

ollama-stop:
	@docker stop ollama-server
	@docker rm ollama-server

nginx-start:
	@docker run \
		--detach \
		--env PROXY_PASS=http://$(ip):11434 \
		--name ollama-proxy \
		--publish 11434:11434 \
		nginx:1.29.0-alpine3.22

nginx-stop:
	@docker stop ollama-proxy
	@docker rm ollama-proxy
