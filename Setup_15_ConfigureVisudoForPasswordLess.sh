#!/bin/bash
echo "%docker ALL=(ALL)  NOPASSWD: /usr/bin/dockerd" | sudo tee -a /etc/sudoers