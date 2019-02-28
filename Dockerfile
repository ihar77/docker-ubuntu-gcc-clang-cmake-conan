FROM ihar77/base-docker-ubuntu-gcc-clang-cmake-conan 

LABEL maintainer="ihar@ukr.net"

RUN   conan install boost/1.69.0@conan/stable

USER develop
VOLUME "/home/project"
WORKDIR "/home/project"

ENTRYPOINT [ "/usr/bin/g++" ]
