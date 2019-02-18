#!/bin/bash

cwd=$(pwd)

docker stop cpp-project-builder
docker rm cpp-project-builder

docker run \
	-it \
	--name cpp-project-builder \
	-p 2000:2000 \
	-v ${cwd}:/home/project \
	--privileged \
	ihar77/cpp-project-builder \
    /bin/bash -c "${@}" 

