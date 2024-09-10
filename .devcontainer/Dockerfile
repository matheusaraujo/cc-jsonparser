FROM alpine:3.20.3

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories

RUN apk add --no-cache \
    gcc \
    g++ \
    make \
    gdb \
    cmocka-dev \
    clang \
    clang-extra-tools
