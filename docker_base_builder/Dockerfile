FROM ubuntu:18.04

LABEL maintainer="ihar@ukr.net"

WORKDIR /project

RUN echo "*** Installing gcc (7->8) and clang (4->7) ***" \
      # GCC
      && apt-get update \
      && apt-get install -y \
                     wget \
                     gnupg \
                     xz-utils \
                     build-essential \
                     curl \
                     python-dev \
                     python-pip \
                     gdb \
                     gdbserver \
      && apt-get update \
      && apt-get dist-upgrade -y --allow-unauthenticated \
      && apt-get install -y --allow-unauthenticated cmake \
      && apt-get -qq update && apt-get install -y --allow-unauthenticated --no-install-recommends gcc-7 g++-7 gcc-8 g++-8 \
      # LLVM
      && wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - \
      && apt-get update \
      # clang 7
      && curl -SL http://releases.llvm.org/7.0.1/clang+llvm-7.0.1-x86_64-linux-gnu-ubuntu-18.04.tar.xz | tar -xJC . \
      && mv clang+llvm-7.0.1-x86_64-linux-gnu-ubuntu-18.04 clang_7.0.1 \
      && echo 'export PATH=/clang_7.0.1/bin:$PATH' >> ~/.bashrc \
      && echo 'export LD_LIBRARY_PATH=/clang_7.0.1/lib:LD_LIBRARY_PATH' >> ~/.bashrc \
      # end clang 7
      && apt-get install -y clang-6.0 clang++-6.0 lldb-6.0 lld-6.0 \
      && apt-get install -y clang-5.0 clang++-5.0 lldb-5.0 lld-5.0 \
      && apt-get install -y clang-4.0 clang++-4.0 \
      && apt-get autoremove --purge -y \
      && apt-get autoclean -y \
      && rm -rf /var/cache/apt/* /tmp/* \
      && echo "Setting gcc and g++ 7 as default compiler" \
      && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 60 --slave /usr/bin/g++ g++ /usr/bin/g++-7 \
      && update-alternatives --config gcc \
      && update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-4.0 100 \
      && update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-6.0 1000 \
      && update-alternatives --install /usr/bin/clang clang /usr/bin/clang-4.0 100 \
      && update-alternatives --install /usr/bin/clang clang /usr/bin/clang-6.0 1000 \
      && update-alternatives --config clang \
      && update-alternatives --config clang++ \
      && pip install conan
      && useradd -ms /bin/bash develop
      && echo "develop   ALL=(ALL:ALL) ALL" >> /etc/sudoers

# for gdbserver
EXPOSE 2000

USER develop
VOLUME "/home/project"
WORKDIR "/home/project"

