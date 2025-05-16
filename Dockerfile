FROM nvidia/cuda:11.8.0-runtime-ubuntu22.04

ENV ALGO="sha3x"
ENV POOL_ADDRESS="ca.luckypool.io:6118"
ENV WALLET_USER="12D1CtJnkqS4CMCFY2No5xeUWpzjH1rZkGHyZoHqYV14aE9mLLVyeuZj1siCh4gsMJgVZKa5aCraZGTEjB5n3oQjm2Y=5g.salad"
ENV PASSWORD="salad"
ENV EXTRAS=""

RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install curl wget xz-utils \
    && cd /opt \
    && curl -L https://github.com/doktor83/SRBMiner-Multi/releases/download/2.8.8/SRBMiner-Multi-2-8-8-Linux.tar.xz -o SRBMiner-Multi.tar.xz \
    && tar xf SRBMiner-Multi.tar.xz \
    && rm -rf SRBMiner-Multi.tar.xz \
    && mv /opt/SRBMiner-Multi-2-8-8/ /opt/SRBMiner-Multi/ \
    && apt-get -y purge xz-utils \
    && apt-get -y autoremove --purge \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

WORKDIR /opt/SRBMiner-Multi/
COPY start_zergpool.sh .

RUN chmod +x start_zergpool.sh

EXPOSE 80

ENTRYPOINT ["./start_zergpool.sh"]
CMD ["", ""]
