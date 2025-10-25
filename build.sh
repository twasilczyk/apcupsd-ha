#!/bin/bash

docker run \
	--rm \
	--privileged \
	-v ~/.docker:/root/.docker \
	-v .:/data \
    ghcr.io/home-assistant/amd64-builder:latest \
		--all \
		-t /data

#docker run \
#	--rm \
#	--privileged \
#	-v ~/.docker:/root/.docker \
#    ghcr.io/home-assistant/amd64-builder:latest \
#		--all \
#		-r https://github.com/twasilczyk/apcupsd-ha \
#		-b main
