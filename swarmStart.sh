#!/bin/bash

# remove all docker/swarm resources
# ./cleanDocker.sh
# pull image and run container
docker run -it \
  --rm \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --env NODE_IP=$(ifconfig en0 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | sed 's/inet //g') \
  --env PORTAINER_IMAGE=portainerci/portainer:2.11 \
  --env PORTAINER_AGENT_IMAGE=portainerci/agent:2.11 \
  --env PORTAINER_ADMIN_PASSWORD=asdfasdf \
  --env ORCHESTRATOR=swarm \
  --env KUBERNETES_VERSION="v1.20.7" \
  --env PORTAINER_BE_LICENSE='' \
  portainer/portable-env:latest

  # cloudflared tunnel --url http://localhost:30777