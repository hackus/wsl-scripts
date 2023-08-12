#!/bin/bash
DOCKER_DISTRO="Ubuntu-22.04"
DOCKER_DIR=/mnt/wsl/shared-docker
DOCKER_SOCK="$DOCKER_DIR/docker.sock"
export DOCKER_HOST="unix://$DOCKER_SOCK"

function docker {
	if [ ! -S "$DOCKER_SOCK" ]; then
		echo running docker
		/c/Windows/System32/wsl -d $DOCKER_DISTRO docker -H $DOCKER_HOST $@
	fi
}

function docker-compose {
	if [ ! -S "$DOCKER_SOCK" ]; then
		echo running docker-compose
		/c/Windows/System32/wsl -d $DOCKER_DISTRO docker-compose -H $DOCKER_HOST $@
	fi
}

function kafka-topics {
	if [ ! -S "$DOCKER_SOCK" ]; then
		echo running kafka-topics
		/c/Windows/System32/wsl -d $DOCKER_DISTRO && exec -it kafka kafka-topics $@ && exit
	fi
}