FROM ubuntu:18.04

RUN apt update \
    && apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev \
    && git clone https://github.com/xmrig/xmrig \
    && mkdir xmrig/build && cd xmrig/build \
    && cmake .. \
    && make -j $(nproc)

ADD config.json xmrig/build/config.json
CMD ["xmrig/build/xmrig"]
