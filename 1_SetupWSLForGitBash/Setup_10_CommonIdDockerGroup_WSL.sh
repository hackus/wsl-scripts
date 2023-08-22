getent group | grep 36257 || echo "Yes, that ID is free"
sudo groupmod -g 36257 docker