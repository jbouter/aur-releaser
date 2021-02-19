FROM alpine:3

# hadolint ignore=DL3018
RUN apk update --no-cache \
 && apk add --no-cache openssh-client openssh-keygen shadow pacman runuser git \
 grep binutils gcc \
 && rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh
COPY build.sh /build.sh
COPY ssh_config /ssh_config

ENTRYPOINT ["/entrypoint.sh"]
