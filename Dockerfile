FROM nvidia/cuda:11.8.0-runtime-ubuntu22.04

ENV ALGO="sha3x"
ENV POOL_ADDRESS="ca.luckypool.io:6118"
ENV WALLET_USER="12D1CtJnkqS4CMCFY2No5xeUWpzjH1rZkGHyZoHqYV14aE9mLLVyeuZj1siCh4gsMJgVZKa5aCraZGTEjB5n3oQjm2Y=5g.salad"
ENV PASSWORD="salad"
ENV EXTRAS=""

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install curl wget xz-utils
RUN cd /opt
RUN curl -L https://github.com/doktor83/SRBMiner-Multi/releases/download/2.8.8/SRBMiner-Multi-2-8-8-Linux.tar.gz -o SRBMiner-Multi.tar.gz
RUN tar xf SRBMiner-Multi.tar.gz
RUN rm -rf SRBMiner-Multi.tar.gz

WORKDIR /opt/SRBMiner-Multi-2-8-8/
COPY start_zergpool.sh .

RUN chmod +x start_zergpool.sh

EXPOSE 80

#ENTRYPOINT ["./start_zergpool.sh"]
#CMD ["", ""]
