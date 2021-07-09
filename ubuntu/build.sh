#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# shellcheck disable=SC1091
source .env
docker build -t "${NAME}" -f Dockerfile .
