#!/bin/bash
# remove all docker/swarm resources
./cleanDocker.sh
# pull image and run container
docker run -it \
  --rm \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --env NODE_IP=$(ifconfig en0 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | sed 's/inet //g') \
  --env PORTAINER_IMAGE=portainer/portainer-ee:2.12.0 \
  --env PORTAINER_AGENT_IMAGE=portainer/agent:2.12.0 \
  --env HOST_PLATFORM=arm64 \
  --env PORTAINER_ADMIN_PASSWORD=asdfasdf \
  --env ORCHESTRATOR=kubernetes \
  --env KUBERNETES_VERSION="v1.23.0" \
  --env PORTAINER_BE_LICENSE='' \
  portainer/portable-env:latest

  # cloudflared tunnel --url http://localhost:30777
