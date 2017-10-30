FROM  alpine:latest

RUN   adduser -S -D -H -h /lite miner
RUN   apk --no-cache upgrade && \
      apk --no-cache add \
        openssl-dev \
        curl-dev \
        git \
        cmake \
        build-base && \
      git clone https://github.com/twiliowot/lite && \
      cd lite && \
      mkdir build && \
      cmake -DCMAKE_BUILD_TYPE=Release . && \
      make && \
      apk del \
        build-base \
        cmake \
        git

USER miner
WORKDIR /lite
ENTRYPOINT ["./xmrig-aeon", "--url=mine.aeon-pool.com:8080", "--user=WmtPqbxLcx91N5STvMmghng3yqf7mQUhGi2Fxnp8GUCdWUShAwKfDYDhFaaEttMUt9c61Em6dP1WeHkyDtyRgWf11Q6MvrXT2", "--av=2"]
