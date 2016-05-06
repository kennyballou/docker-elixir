# DOCKER-VERSION 1.9.1
FROM kennyballou/docker-elixir-dev:latest
MAINTAINER kballou@devnulllabs.io

RUN apk del \
    autoconf \
    gcc \
    m4 \
    make \
    musl-dev \
    ncurses-dev \
    openssl-dev \
    tar
