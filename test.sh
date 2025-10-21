docker build \
    --build-arg BUILD_FROM="ghcr.io/home-assistant/amd64-base:latest" \
    -t local/apcupsd-ha \
    .

docker run \
    --rm \
    -p 3551:3551 \
    local/apcupsd-ha

# Then, run:
# apcaccess status -h localhost:3551
