@echo off
set DOCKER_DISTRO=Ubuntu-22.04
wsl -d %DOCKER_DISTRO% docker -H unix:///mnt/wsl/shared-docker/docker.sock %*
