#!/bin/bash
DOCKER_DISTRO="Ubuntu-22.04"
DOCKER_DIR=/mnt/wsl/shared-docker
DOCKER_SOCK="$DOCKER_DIR/docker.sock"
export DOCKER_HOST="unix://$DOCKER_SOCK"

function docker {
	if [ ! -S "$DOCKER_SOCK" ]; then
		echo running docker
		/c/Windows/System32/wsl -d $DOCKER_DISTRO docker -H unix:///mnt/wsl/shared-docker/docker.sock $@
	fi
}

function docker-compose {
	if [ ! -S "$DOCKER_SOCK" ]; then
		echo running docker-compose
		/c/Windows/System32/wsl -d $DOCKER_DISTRO docker compose $@
	fi
}