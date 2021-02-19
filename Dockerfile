FROM alpine:latest

RUN apk update --no-cache \
 && apk add --no-cache openssh-client openssh-keygen shadow pacman runuser \
 && rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh
COPY build.sh /build.sh
COPY ssh_config /ssh_config

ENTRYPOINT ["/entrypoint.sh"]
