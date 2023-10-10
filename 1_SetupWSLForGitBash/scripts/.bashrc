#!/bin/bash
DOCKER_DISTRO="Ubuntu-22.04"
#DOCKER_DIR=/mnt/wsl/shared-docker
DOCKER_DIR=/var/run
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

function k3d {
	if [ ! -S "$DOCKER_SOCK" ]; then
		echo running k3d
		/c/Windows/System32/wsl -d $DOCKER_DISTRO k3d $@
	fi
}

function kubectl {
	if [ ! -S "$DOCKER_SOCK" ]; then
		echo running kubectl
		/c/Windows/System32/wsl -d $DOCKER_DISTRO kubectl $@
	fi
}

function grype {
	if [ ! -S "$DOCKER_SOCK" ]; then
		echo running grype
		/c/Windows/System32/wsl -d $DOCKER_DISTRO grype $@
	fi
}