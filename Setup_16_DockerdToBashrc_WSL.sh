#!/bin/bash
filename=~/.bashrc_backup_2

if [ -f $filename ]; then
  echo bashrc_backup_2 already exists
else
  cp ~/.bashrc ~/.bashrc_backup_2
fi

grep -F 'DOCKER_DISTRO="Ubuntu-22.04"' ~/.bashrc || (echo >> ~/.bashrc \
 && echo 'DOCKER_DISTRO="Ubuntu-22.04"' >> ~/.bashrc \
 && echo 'DOCKER_DIR=/mnt/wsl/shared-docker' >> ~/.bashrc \
 && echo 'DOCKER_SOCK="$DOCKER_DIR/docker.sock"' >> ~/.bashrc \
 && echo 'export DOCKER_HOST="unix://$DOCKER_SOCK"' >> ~/.bashrc \
 && echo 'if [ ! -S "$DOCKER_SOCK" ]; then' >> ~/.bashrc \
 && echo '    mkdir -pm o=,ug=rwx "$DOCKER_DIR"' >> ~/.bashrc \
 && echo '    chgrp docker "$DOCKER_DIR"' >> ~/.bashrc \
 && echo '    nohup sudo -b dockerd -H $DOCKER_HOST < /dev/null > $DOCKER_DIR/dockerd.log 2>&1' >> ~/.bashrc \
 && echo 'fi' >> ~/.bashrc \
 && echo  >> ~/.bashrc)
 
source ~/.bashrc
