#!/bin/bash
DOCKER_DIR=/mnt/wsl/shared-docker
DOCKER_SOCKET_DIR=/var/run
mkdir -pm o=,ug=rwx "$DOCKER_DIR"
sudo chgrp docker "$DOCKER_DIR"
echo "{" > "$DOCKER_DIR/daemon.json"
echo '    "hosts": ["unix://$DOCKER_SOCKET_DIR/docker.sock"]' >> "$DOCKER_DIR/daemon.json"
echo "}" >> "$DOCKER_DIR/daemon.json"

#unix:///var/run/docker.sock