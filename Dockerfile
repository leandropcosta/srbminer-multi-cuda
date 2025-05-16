FROM nvidia/cuda:11.8.0-runtime-ubuntu22.04

ENV ALGO="sha3x"
ENV POOL_ADDRESS="ca.luckypool.io:6118"
ENV WALLET_USER="12BrRYQMCQkqQCodzQTJbg3nBvRP8n4wRPUHWxwKNQkHJU9VAKqxcrFyTXsdqAAhuvDEbeVRtPb4ZpPskrbUPzG3uRg"

RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install curl wget xz-utils
RUN cd /opt 
RUN curl -L https://github.com/doktor83/SRBMiner-Multi/releases/download/2.8.8/SRBMiner-Multi-2-8-8-Linux.tar.xz -o SRBMiner-Multi.tar.xz
RUN tar xf SRBMiner-Multi.tar.xz
RUN rm -rf SRBMiner-Multi.tar.xz
RUN mv /opt/SRBMiner-Multi-2-8-8/ /opt/SRBMiner-Multi/
RUN apt-get -y purge xz-utils
RUN apt-get -y autoremove --purge
RUN apt-get -y clean
RUN rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

WORKDIR /opt/SRBMiner-Multi/
COPY start_zergpool.sh .

RUN chmod +x start_zergpool.sh

EXPOSE 80

ENTRYPOINT ["./start_zergpool.sh"]
CMD ["--api-enable", "--api-port", "80", "--disable-auto-affinity", "--disable-ptx-check"]
