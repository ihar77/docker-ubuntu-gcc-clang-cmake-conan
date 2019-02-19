#!/bin/bash

cwd=$(pwd)

docker build \
    -t ihar77/cpp-base-builder \
    ./docker_base_builder/

docker build \
    -t ihar77/cpp-project-builder \
    .
