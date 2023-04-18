FROM alpine

ADD script.sh /script.sh

RUN apk add git make cmake libstdc++ gcc g++ libuv-dev openssl-dev hwloc-dev
RUN git clone https://github.com/xmrig/xmrig
RUN mkdir xmrig/build && cd xmrig/build
RUN cmake ..
RUN make -j$(nproc)

CMD ["/script.sh"]
