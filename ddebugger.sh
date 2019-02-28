#!/bin/bash

cwd=$(pwd)

docker stop project-docker-ubuntu-gcc-clang-cmake-conan
docker rm project-docker-ubuntu-gcc-clang-cmake-conan
docker run \
	-dt \
	--name project-docker-ubuntu-gcc-clang-cmake-conan \
	-p 2000:2000 \
	-v ${cwd}:home/project \
	--privileged \
	ihar77/project-docker-ubuntu-gcc-clang-cmake-conan \
    "${@}" 

