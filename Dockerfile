FROM alpine:3

RUN apk add --no-cache openssh-client openssh-keygen shadow pacman pacman-makepkg \
 runuser git grep binutils gcc

COPY entrypoint.sh /entrypoint.sh
COPY build.sh /build.sh
COPY ssh_config /ssh_config

ENTRYPOINT ["/entrypoint.sh"]
