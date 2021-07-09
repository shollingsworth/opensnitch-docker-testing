#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# shellcheck disable=SC1091
source .env

password="${1?"argv0:password"}"
repopath="${2?"argv1:repopath"}"

docker run \
    -p 127.0.0.1:5900:5900 \
    -e VNC_PASSWORD="${password}" \
    -e GEOMETRY="${GEOMETRY:-"1024x768"}" \
    -v "${repopath}":/repo \
    --privileged \
    -it --rm \
    --name "${NAME}-test" \
    --hostname "${NAME}-test" \
    "${NAME}"
