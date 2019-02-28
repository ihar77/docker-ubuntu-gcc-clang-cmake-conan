#!/bin/bash

cwd=$(pwd)

docker stop base-docker-ubuntu-gcc-clang-cmake-conan
docker rm base-docker-ubuntu-gcc-clang-cmake-conan
docker run \
	-it \
    --entrypoint="" \
	--name base-docker-ubuntu-gcc-clang-cmake-conan \
	-p 2000:2000 \
	-v ${cwd}:/home/project \
	--privileged \
	ihar77/base-docker-ubuntu-gcc-clang-cmake-conan \
    /bin/bash -c "${@}" 

