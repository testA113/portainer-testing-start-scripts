#!/bin/bash
# ./cleanDocker.sh
docker login
docker pull portainerci/portainer-ee:$1
docker run -d -p 8000:8000 -p $2:$2 --name=portainer-ee --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer-ee:/data portainerci/portainer-ee:$1