#!/bin/bash
DOCKER_DAEMON_CONFIG_DIR=/etc/docker
DOCKER_SOCKET_DIR=/var/run
#mkdir -pm o=,ug=rwx "$DOCKER_DIR"

#*************************************************
# Documentation: https://github.com/microsoft/WSL/issues/2527
# unix:///var/run/docker.sock
#*************************************************
sudo chgrp docker "$DOCKER_DAEMON_CONFIG_DIR"
sudo rm -rf "$DOCKER_DAEMON_CONFIG_DIR/daemon.json"
sudo echo "{" | sudo tee -a "$DOCKER_DAEMON_CONFIG_DIR/daemon.json"
#sudo echo "    \"hosts\": [\"unix://$DOCKER_SOCKET_DIR/docker.sock\",\"tcp://127.0.0.1:2376\"]" | sudo tee --append "$DOCKER_DAEMON_CONFIG_DIR/daemon.json"
sudo echo "    \"hosts\": [\"unix://$DOCKER_SOCKET_DIR/docker.sock\",\"tcp://127.0.0.1:2375\"]" | sudo tee --append "$DOCKER_DAEMON_CONFIG_DIR/daemon.json"
sudo echo "}" | sudo tee --append "$DOCKER_DAEMON_CONFIG_DIR/daemon.json"
sudo chown $USER:docker "$DOCKER_DAEMON_CONFIG_DIR/daemon.json"

#sudo echo "{" > "$DOCKER_DAEMON_CONFIG_DIR/daemon.json"
#sudo echo '    "hosts": ["unix://$DOCKER_SOCKET_DIR/docker.sock","tcp://127.0.0.1:2375"]' >> "$DOCKER_DAEMON_CONFIG_DIR/daemon.json"
#sudo echo "}" >> "$DOCKER_DAEMON_CONFIG_DIR/daemon.json"

#*************************************************
# Documentation: https://stackoverflow.com/questions/44052054/unable-to-start-docker-after-configuring-hosts-in-daemon-json
#*************************************************

#sudo cp  /lib/systemd/system/docker.service.backup /lib/systemd/system/docker.service
sudo rm -rf /etc/systemd/system/docker.service
sudo cp /lib/systemd/system/docker.service /etc/systemd/system/docker.service
#sudo cp /lib/systemd/system/docker.service /etc/systemd/system/

#sudo chown $USER:docker /etc/systemd/system/docker.service

sudo sed -i 's/\ -H\ fd:\/\///g' /etc/systemd/system/docker.service
sudo sed -i 's/ExecStart=\/usr\/bin\/dockerd/ExecStart=sudo\ \/usr\/bin\/dockerd/g' /etc/systemd/system/docker.service
cat /etc/systemd/system/docker.service
echo "run daemon-reload"
sudo systemctl daemon-reload
echo "run docker restart"
sudo service docker restart &
