#!/bin/bash

if [[ ! -d "$HOME/bin" ]]; then mkdir -p "$HOME/bin"; fi && \
curl -L https://github.com/docker/machine/releases/download/v0.8.2/docker-machine-Windows-x86_64.exe > "$HOME/bin/docker-machine.exe" && \
chmod +x "$HOME/bin/docker-machine.exe"
cp "$HOME/bin/docker-machine.exe" "$MAVEN_HOME/bin"
######docker-machine create --driver virtualbox dev
docker-machine rm -f default
docker-machine create -d virtualbox --virtualbox-memory=4096 \
    --virtualbox-cpu-count=4 --virtualbox-disk-size=40960 \
    --virtualbox-no-vtx-check default
#This is with administrative rights only and uses hyperv
#docker-machine create -d hyperv default