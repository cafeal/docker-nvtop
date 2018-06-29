FROM nvidia/cuda

RUN apt-get update && \
    apt-get install -y cmake libncurses5-dev git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /work/*

RUN cd /tmp && \
    git clone https://github.com/Syllo/nvtop.git && \
    mkdir -p nvtop/build && cd nvtop/build && \
    cmake .. && \
    make && \ 
    make install && \
    cd / && \
    rm -r /tmp/nvtop

CMD ["/usr/local/bin/nvtop"]
