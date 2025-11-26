# 课程要求：基于 ubuntu:24.04
FROM ubuntu:24.04

# 避免 tzdata 等交互式配置
ENV DEBIAN_FRONTEND=noninteractive

# 安装基础编译环境 + CMake + 依赖库
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

# 工作目录：和作业说明保持一致
WORKDIR /cmake-exercise

# 把当前仓库代码拷进容器
COPY . /cmake-exercise

# 确保脚本可执行
RUN chmod +x build_and_run.sh

# 默认给一个 shell，方便助教进去手动执行 build_and_run.sh
CMD ["/bin/bash"]
