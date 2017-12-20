FROM ubuntu:xenial

LABEL maintainer="info@micheleadduci.net"

WORKDIR /project

RUN echo "*** Installing gcc (4.9->7) and clang (3.8->5) ***" \
      && echo "deb http://ppa.launchpad.net/ubuntu-toolchain-r/test/ubuntu xenial main \
      deb-src http://ppa.launchpad.net/ubuntu-toolchain-r/test/ubuntu xenial main \
      deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial main \
      deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial main \
      deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-4.0 main \
      deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial-4.0 main \
      deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-5.0 main \
      deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial-5.0 main" \
      > /etc/apt/sources.list.d/ppa-test.list \
      && apt-get update \
      && apt-get install -y \
                    software-properties-common \
                    wget \
      && add-apt-repository -y ppa:ubuntu-toolchain-r/test \
      && apt-get update \
      && apt-get dist-upgrade -y \
      && apt-get install -y cmake \
      && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 60C317803A41BA51845E371A1E9377A2BA9EF27F \
      && apt-get -qq update && apt-get install -y --no-install-recommends gcc-7 g++-7 \
      && wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - \
      && apt-get update \
      && apt-get install -y clang-3.8 clang++-3.8 \
      && apt-get install -y clang-3.9 clang++-3.9 \
      && apt-get install -y clang-4.0 clang++-4.0 \
      && apt-get install -y clang-5.0 clang++-5.0 \
      && apt-get autoremove --purge -y \
      && apt-get autoclean -y \
      && rm -rf /var/cache/apt/* /tmp/* \
      && echo "Setting gcc and g++ 7 as default compiler" \
      && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 60 --slave /usr/bin/g++ g++ /usr/bin/g++-7 \
      && update-alternatives --config gcc

#RUN echo "*** Installing gcc (4.9->7) and clang (3.8->5) ***" \    
#  && echo "deb http://ftp.us.debian.org/debian jessie main contrib non-free" >> /etc/apt/sources.list.d/jessie.list \
#  && echo "deb http://ftp.us.debian.org/debian unstable main contrib non-free" >> /etc/apt/sources.list.d/unstable.list \
#  && apt-get update \
#  && apt-get dist-upgrade -y \
#  && apt-get install -y \
#  cmake \
#  && apt-get install -y g++-4.9 g++-5 g++-6 g++-7 \
#  && apt-get install -y clang++-3.8 \
#  && apt-get install -y clang++-3.9 \
#  && apt-get install -y clang++-4.0 \
#  && apt-get install -y clang++-5.0 \
#  && apt-get autoremove --purge -y \
#  && apt-get autoclean -y \
#  && rm -rf /var/cache/apt/* /tmp/* \
#  && echo "Setting g++ 7 as default compiler" \
#  && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 1

ENTRYPOINT [ "/usr/bin/g++" ]
