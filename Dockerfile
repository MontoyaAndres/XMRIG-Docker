FROM alpine

RUN apk add git make cmake libstdc++ gcc g++ libuv-dev openssl-dev hwloc-dev
RUN git clone https://github.com/xmrig/xmrig
RUN mkdir xmrig/build && cd xmrig/build
RUN cmake ..
RUN make -j$(nproc)

ENV WALLET="82dewoRStv6Tvax5oV9zLSj3SX4SP58LXEeSghW3xrNbBdcfh38MdHwUAiQ56yiYbn4pvtU8g1DarfbVPqXFfEKXKL2H2qB"

ADD script.sh /script.sh
CMD ["/script.sh"]
