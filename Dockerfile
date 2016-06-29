# DOCKER-VERSION 1.9.1
FROM kennyballou/docker-erlang:19.0
MAINTAINER kballou@devnulllabs.io

ENV ELIXIR_VERSION=1.3.1

RUN apk update \
    && apk add \
       autoconf \
       bash \
       curl \
       gcc \
       m4 \
       make \
       musl-dev \
       ncurses-dev \
       openssl-dev \
       tar \
    && ELIXIR_SRC_URL="https://github.com/elixir-lang/elixir/archive/v$ELIXIR_VERSION.tar.gz" \
    && ELIXIR_SRC_SUM="c4ab90a0d8d7ed4159dd6b7e1bcbcdbdb8c6177a35328d774fccf00346b4b42c" \
    && curl -fSL "$ELIXIR_SRC_URL" -o elixir.tar.gz \
    && echo "${ELIXIR_SRC_SUM}  elixir.tar.gz" | sha256sum -c - \
    && mkdir -p /usr/src/elixir-src \
    && tar -zxf elixir.tar.gz -C /usr/src/elixir-src --strip-components=1 \
    && rm -f elixir.tar.gz \
    && cd /usr/src/elixir-src \
    && make install \
    && cd / \
    && rm -rf /usr/src/elixir-src \
    && mix local.hex --force \
    && mix hex.info \
    && apk del \
       autoconf \
       bash \
       curl \
       gcc \
       m4 \
       make \
       musl-dev \
       ncurses-dev \
       openssl-dev \
       tar

CMD ["iex"]
