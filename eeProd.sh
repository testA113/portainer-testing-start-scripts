#!/bin/bash
./cleanDocker.sh
docker login
docker pull portainer/portainer-ee:$1
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer-ee --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer-ee:/data portainer/portainer-ee:$1