#!/bin/bash
DOCKER_DIR=/mnt/wsl/shared-docker
mkdir -pm o=,ug=rwx "$DOCKER_DIR"
sudo chgrp docker "$DOCKER_DIR"
echo "{" > "$DOCKER_DIR/daemon.json"
echo '    "hosts": ["unix://$DOCKER_DIR/docker.sock"]' >> "$DOCKER_DIR/daemon.json"
echo "}" >> "$DOCKER_DIR/daemon.json"