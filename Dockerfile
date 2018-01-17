FROM ubuntu:xenial

LABEL maintainer="info@micheleadduci.net"

WORKDIR /project

RUN echo "*** Installing gcc (4.9->7) and clang (3.8->5) ***" \
      # GCC
      && echo "deb http://ppa.launchpad.net/ubuntu-toolchain-r/test/ubuntu xenial main \
      deb-src http://ppa.launchpad.net/ubuntu-toolchain-r/test/ubuntu xenial main" \
      > /etc/apt/sources.list.d/ppa-test.list \
      && apt-get update \
      && apt-get install -y \
#                    software-properties-common \
                     wget \
#      && add-apt-repository -y ppa:ubuntu-toolchain-r/test \
      && apt-get update \
      && apt-get dist-upgrade -y --allow-unauthenticated \
      && apt-get install -y --allow-unauthenticated cmake \
      && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 60C317803A41BA51845E371A1E9377A2BA9EF27F \
      && apt-get -qq update && apt-get install -y --allow-unauthenticated --no-install-recommends gcc-7 g++-7 \
      # LLVM
      && echo "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial main \
      deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial main \
      deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-4.0 main \
      deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial-4.0 main \
      deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-5.0 main \
      deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial-5.0 main" \
      > /etc/apt/sources.list.d/llvm.list \
      && wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - \
#      && apt-add-repository -y "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-5.0 main" \
#      && apt-add-repository -y "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-4.0 main" \
      && apt-get update \
      && apt-get install -y clang-5.0 clang++-5.0 lldb-5.0 lld-5.0 \
      && apt-get install -y clang-3.8 clang++-3.8 \
      && apt-get install -y clang-3.9 clang++-3.9 \
      && apt-get install -y clang-4.0 clang++-4.0 \
      && apt-get autoremove --purge -y \
      && apt-get autoclean -y \
      && rm -rf /var/cache/apt/* /tmp/* \
      && echo "Setting gcc and g++ 7 as default compiler" \
      && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 60 --slave /usr/bin/g++ g++ /usr/bin/g++-7 \
      && update-alternatives --config gcc \
      && wget -O /tmp/conan.deb -L http://downloads.conan.io/latest_debian \ 
      && dpkg -i /tmp/conan.deb

ENTRYPOINT [ "/usr/bin/g++" ]
