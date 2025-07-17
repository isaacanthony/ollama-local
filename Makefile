start:
	@docker run \
		--detach \
		--gpus all \
		--name ollama \
		--publish 11434:11434 \
		--volume $(PWD)/.ollama:/root/.ollama \
		ollama/ollama:0.6.8
	@make -s run model=qwen2.5-coder:7b
	@echo "http://localhost:11434 \n"
	@ifconfig | grep 192  # local ip address

run:
	@docker exec ollama ollama run $(model)

stop:
	@docker stop ollama
	@docker rm ollama
