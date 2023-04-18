FROM alpine

RUN set -xe;\
    echo "@community http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; \
    apk update; \
    apk add git util-linux build-base make cmake libuv-static libuv-dev libstdc++ gcc g++ openssl-dev hwloc-dev; \
    git clone https://github.com/xmrig/xmrig; \
    mkdir xmrig/build && cd xmrig/build; \
    cmake .. -DCMAKE_BUILD_TYPE=Release -DUV_LIBRARY=/usr/lib/libuv.a;\
    make -j $(nproc);

ADD config.json xmrig/build/config.json
CMD ["xmrig/build/xmrig"]
