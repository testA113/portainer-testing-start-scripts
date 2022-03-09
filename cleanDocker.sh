#!/bin/bash

# Delete all docker resources on your machine for a fresh, empty clean docker

# swarm only commands
if [ "$(docker info --format '{{.Swarm.LocalNodeState}}')" == "active" ]; then
  echo "in swarm mode"
  echo "🐳 deleting services"
  services=$(docker service ls -q)
  if [ "${#services}" != "0" ]; then 
    docker service rm $services
  fi
  echo "🐳 deleting secrets"
  secrets=$(docker secret ls -q)
  if [ "${#secrets}" != "0" ]; then 
    docker secret rm $secrets
  fi
  echo "🐳 deleting configs"
  configs=$(docker config ls -q)
  if [ "${#configs}" != "0" ]; then 
    docker config rm $configs
  fi
fi
# standalone and swarm commands
echo "🐳 deleting containers"
containers=$(docker ps -a -q)
if [ "${#containers}" != "0" ]; then 
  docker rm -f $containers
fi
echo "🐳 deleting images"
images=$(docker image ls -q)
if [ "${#images}" != "0" ]; then 
  docker image rm -f $images
fi
echo "🐳 deleting volumes"
docker volume prune -f
echo "🐳 deleting networks"
docker network prune -f 
echo "🐳 deleting cache"
docker builder prune -f