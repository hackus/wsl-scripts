@echo off
set DOCKER_DISTRO=Ubuntu-22.04
set DOCKER_DIR=/mnt/wsl/shared-docker
set DOCKER_SOCK="$DOCKER_DIR/docker.sock"
set DOCKER_HOST="unix://$DOCKER_SOCK"
wsl -d %DOCKER_DISTRO% docker-compose %*
