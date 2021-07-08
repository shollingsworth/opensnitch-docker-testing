#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

password="${1?"argv0:password"}"

docker run \
    -p 5900:5900 \
    -e VNC_PASSWORD="${password}" \
    --privileged \
    -it --rm \
    --name arch \
    --hostname arch-test \
    arch-opensnitch
