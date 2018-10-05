#!/bin/bash

. env.sh

if [ ! "$(docker ps -q -f name=alastria)" ]; then
    if [ "$(docker ps -aq -f status=exited -f name=alastria)" ]; then
        echo  "delete old alastria container"
        docker rm alastria     	
    fi
    echo  "start alastria container with alastria-node image and external data directory" 
    docker run -d --name alastria  -v $(readlink -f $TODIR/data):/root/alastria-node/data -p 9000:9000 -p 21000:21000 -p 22000:22000 -p 8443:8443 alastria-node
else
  echo "ERROR: alastria container is still running ....[abort]"	
fi



