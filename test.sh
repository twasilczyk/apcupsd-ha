#!/bin/bash

docker build \
    --build-arg BUILD_FROM="ghcr.io/home-assistant/amd64-base:latest" \
    -t local/apcupsd-ha \
    .

docker run \
    --rm \
    $1 \
    local/apcupsd-ha \
    $2

# Then, run:
# apcaccess status -h localhost:3551
