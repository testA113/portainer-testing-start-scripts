#!/bin/bash
# remove all docker/swarm resources
./cleanDocker.sh
# pull image and run container
docker login
docker pull portainerci/portainer:$1
docker run -d -p 8000:8000 -p $2:$2 --name=portainer-ce --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer-ce:/data portainerci/portainer:$1