#!/bin/bash
docker rm -f $(docker ps -a -q)
docker service rm $(docker service ls -q)
docker image rm -f $(docker image ls -q)
docker volume prune -f
docker network prune -f 
docker secret rm $(docker secret ls -q)
docker config rm $(docker config ls -q)
