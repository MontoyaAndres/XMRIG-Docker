FROM alpine

RUN set -xe;\
    apk update; \
    apk add git make cmake libstdc++ gcc g++ libuv-dev openssl-dev hwloc-dev; \
    git clone https://github.com/xmrig/xmrig; \
    mkdir xmrig/build && cd xmrig/build; \
    cmake -DWITH_HWLOCK=OFF ..; \
    make -j $(nproc);

ADD config.json xmrig/build/config.json
CMD ["xmrig/build/xmrig"]
