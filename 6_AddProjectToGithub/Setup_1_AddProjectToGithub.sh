#!/bin/bash

echo '********************************************'
echo 'This script has to be executed in the folder to be added in git'
echo 'Execution example:'
echo 'Param 1 path to git'
echo 'Param 2 repo name(used to create readme)'
echo "./Setup_1_AddProjectToGithub.sh git@github.com:hackus/online_shopping_config_server.git online_shopping_config_server"
echo "../../docker/setup/6_AddProjectToGithub/Setup_1_AddProjectToGithub.sh git@github.com:QSoftOrg/online_shopping_config_server.git online_shopping_config_server"
echo '********************************************'

echo '********************************************'
echo 'execution example'
echo "Add git ignore for intelij projects"
echo '********************************************'
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

echo "$parent_path"
cp -r $parent_path/scripts/.gitignore_intellij .gitignore

echo '********************************************'
echo "if new create readme"
echo "# online_shopping_config_server" >> README.md
echo '********************************************'
echo "# $2" >> README.md

echo '********************************************'
echo "init, rebase and push to git"
echo '********************************************'
git init -b main
git add .
git commit -m "First commit"
git remote add origin $1
git remote -v
git branch --set-upstream-to=origin/main main
git pull -r
git push -u origin main