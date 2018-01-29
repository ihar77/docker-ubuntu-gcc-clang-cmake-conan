# docker-linux-cpp

A basic docker image for C++ developers, featuring g++ (from 4.9 up to 7.x) and clang++ (from 3.8 to 5.0), CMake, Conan. The default compiler is g++ 7, but you're free to modify the Dockerfile and set your own; as example, if you want to set g++ 4.9 as the default compiler, just write the following Dockerfile and build a new image:
The project was insired by madduci/docker-linux-cpp (https://github.com/madduci/docker-linux-cpp), but based on Ubuntu 16.04 

```
# Dockerfile
FROM ihar77/gcc_clang_cmake_boost

RUN update-alternatives --remove g++ /usr/bin/g++-7 \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 1
```

```
$> docker build -t docker-gcc-4.9 .
```

As default working directory, `/project` is being used, but feel free to change it.

## Requirements

* Docker (possibly the latest version, 17.06+)

## Build/Run instructions

You can just type in your terminal:

`docker pull ihar77/gcc_clang_cmake_boost`

to use my docker image or, in case of adjustments to the `Dockerfile`, just type:

`docker run --rm -it -v /your/folder:/project ihar77/gcc_clang_cmake_boost my_file.cpp` 
