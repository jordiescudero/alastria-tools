#!/bin/bash

. env.sh

echo  "create local config directory:" $CONFIG_DIR
mkdir $CONFIG_DIR

echo  "create local data directory:" $DATA_DIR
mkdir $DATA_DIR

echo  "clone alastria-node github" 
git clone -b develop https://github.com/alastria/alastria-node.git

echo  "create alastria-node configurated image" 
docker build -t alastria-node alastria-node --build-arg hostip=$IP --build-arg nodetype=general --build-arg nodename=$NODE_NAME

echo  "create temporal container" 
docker container create --name tmp_alastria_node_container alastria-node

echo  "data directory extraction" 
docker cp  tmp_alastria_node_container:/root/alastria-node/data $CONFIG_DIR

docker cp tmp_alastria_node_container:/root/alastria/data/geth $DATA_DIR/geth
docker cp tmp_alastria_node_container:/root/alastria/data/constellation $DATA_DIR/constellation

echo  "delete temporal container" 
docker rm -v tmp_alastria_node_container

echo "generate docker-compose file"
source env.sh; rm -rf docker-compose.yml; envsubst < "compose/docker-compose-template.yml" > "docker-compose.yml";



