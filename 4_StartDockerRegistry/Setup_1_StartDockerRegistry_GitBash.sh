#!/usr/bin/bash

echo ''
echo '*************************************************************'
echo 'Run local docker registry'
echo '*************************************************************'
#find current shell:
#echo $SHELL
docker ps -q --filter "name=registry" | grep -q . && docker stop registry && docker rm -fv registry
docker run -d -p 5000:5000 --restart=always --name registry registry:2

#****************************
# How to add a tag in local repo
# Tutorial: https://stackoverflow.com/questions/58654118/pulling-local-repository-docker-image-from-kubernetes
#****************************
# docker tag online-shop:0.0.1-SNAPSHOT 127.0.0.1:5000/online-shop:0.0.1-SNAPSHOT
# docker push 127.0.0.1:5000/online-shop:0.0.1-SNAPSHOT
# kubectl create deployment online-shop --image=127.0.0.1:5000/online-shop:0.0.1-SNAPSHOT