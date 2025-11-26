FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# ---- basic env & dependency ----
RUN apt-get update && \
    apt-get install -y \
        build-essential \
        cmake \
        git \
        wget \
        unzip \
        vim \
        libboost-all-dev \
        libdeal.ii-dev \
    && rm -rf /var/lib/apt/lists/*

# ---- install yaml-cpp v0.6.3----
WORKDIR /opt

RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.tar.gz -O yaml-cpp-0.6.3.tar.gz && \
    tar xzf yaml-cpp-0.6.3.tar.gz && \
    cd yaml-cpp-yaml-cpp-0.6.3 && \
    mkdir build && cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DYAML_BUILD_SHARED_LIBS=ON .. && \
    make -j"$(nproc)" && \
    make install && \
    ldconfig

WORKDIR /cmake-exercise
COPY . /cmake-exercise

RUN rm -rf build main

RUN chmod +x build_and_run.sh

CMD ["/bin/bash"]

