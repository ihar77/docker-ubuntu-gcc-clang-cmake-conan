#!/bin/bash

cwd=$(pwd)

docker build \
    -t ihar77/base-docker-ubuntu-gcc-clang-cmake-conan \
    ./docker_base_builder/

docker build \
    -t ihar77/project-docker-ubuntu-gcc-clang-cmake-conan \
    .
