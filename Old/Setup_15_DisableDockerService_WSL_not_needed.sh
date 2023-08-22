#!/bin/bash

sudo systemctl disable docker.service
sudo systemctl disable docker.socket
sudo systemctl stop docker
sudo systemctl stop docker.socket