#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

docker run \
    -p 5900:5900 \
    -e VNC_PASSWORD=testing \
    --privileged \
    -it --rm \
    --name arch \
    --hostname arch-test \
    arch-opensnitch
