#!/bin/bash
# remove all docker/swarm resources
./cleanDocker.sh
# pull image and run container
docker run -it \
  --rm \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --env NODE_IP=$(ifconfig en0 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | sed 's/inet //g') \
  --env PORTAINER_ADMIN_PASSWORD=asdfasdf \
  --env PORTAINER_IMAGE=portainerci/portainer-ee:develop \
  --env PORTAINER_AGENT_IMAGE=portainerci/agent:develop \
  --env PORTAINER_BE_LICENSE='' \
  --env ORCHESTRATOR=standalone \
  portainer/portable-env:latest
