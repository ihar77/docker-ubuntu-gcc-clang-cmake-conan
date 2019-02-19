FROM ihar77/cpp-base-builder

LABEL maintainer="ihar@ukr.net"

RUN   conan install boost/1.69.0@conan/stable

USER develop
VOLUME "/home/project"
WORKDIR "/home/project"

