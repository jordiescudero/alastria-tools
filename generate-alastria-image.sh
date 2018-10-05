#!/bin/bash

. env.sh

echo  "create local data data directory:" $TODIR
mkdir $TODIR

echo  "clone alastria-node github" 
git clone -b develop https://github.com/alastria/alastria-node.git

echo  "create alastria-node configurated image" 
docker build -t alastria-node alastria-node --build-arg hostip=$IP --build-arg nodetype=general --build-arg nodename=$NODE_NAME

echo  "create temporal container" 
docker container create --name tmp_alastria_node_container alastria-node

echo  "data directory extraction" 
docker cp  tmp_alastria_node_container:/root/alastria-node/data $TODIR

echo  "delete temporal container" 
docker rm -v tmp_alastria_node_container


