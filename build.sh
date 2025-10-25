#!/bin/bash

#docker run --rm --privileged \
#  -v ~/.docker/config.json:/root/.docker/config.json:ro \
#  -v /var/run/docker.sock:/var/run/docker.sock:ro \
#  -v "$PWD":/data \
#  ghcr.io/home-assistant/amd64-builder:latest \
#    --all \
#    -t /data \
#    -i ghcr.io/twasilczyk/apcupsd-ha-{arch}


docker run \
	--rm \
	--privileged \
	-v ~/.docker:/root/.docker \
    ghcr.io/home-assistant/amd64-builder:latest \
		--all \
		-t apcupsd-ha \
		-r https://github.com/twasilczyk/apcupsd-ha \
		-b main
