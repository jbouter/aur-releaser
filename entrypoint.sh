#!/bin/bash

set -euo pipefail

pkgbuild=$INPUT_PKGBUILD

echo '::group::Creating builder user'
useradd --create-home --shell /bin/bash builder
passwd --delete builder
echo '::endgroup::'

echo '::group::Initializing ssh directory'
mkdir -pv /home/builder/.ssh
touch /home/builder/.ssh/known_hosts
cp -v /ssh_config /home/builder/.ssh/config
chown -vR builder:builder /home/builder
chmod -vR 600 /home/builder/.ssh/*
echo '::endgroup::'

echo '::group::Copying PKGBUILD'
cp -r "$pkgbuild" /PKGBUILD
echo '::endgroup::'

exec runuser builder --command 'bash -l -c /build.sh'
