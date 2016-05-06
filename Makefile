TAG=kennyballou/docker-elixir
all: build
.PHONY: all clean

build: Dockerfile
	@docker build -t ${TAG} .

clean:
	@docker rmi ${TAG}
