#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

echo "$parent_path"
cp -r $parent_path/scripts/.bashrc ~
cp -r $parent_path/scripts/.bash_profile ~

source ~/.bashrc
