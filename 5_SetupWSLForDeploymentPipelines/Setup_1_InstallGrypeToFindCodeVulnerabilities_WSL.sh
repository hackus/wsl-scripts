#!/bin/bash

echo '*************************************************************'
echo 'Uninstall grype'
echo '*************************************************************'
sudo rm -rf /usr/local/bin/grype
rm -rf ~/.cache/grype

echo '*************************************************************'
echo 'Install grype'
echo 'https://lindevs.com/install-grype-on-ubuntu'
echo '*************************************************************'
wget -qO - https://raw.githubusercontent.com/anchore/grype/main/install.sh | sudo bash -s -- -b /usr/local/bin

echo '*************************************************************'
echo 'Check grype works'
echo '*************************************************************'
grype version

#grype ubuntu:latest