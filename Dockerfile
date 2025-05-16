FROM nvidia/cuda:11.8.0-runtime-ubuntu22.04

RUN apt-get -y install curl
RUN apt-get -y install xz-utils
RUN cd /opt
RUN curl -L https://github.com/doktor83/SRBMiner-Multi/releases/download/2.8.8/SRBMiner-Multi-2-8-8-Linux.tar.gz -o /opt/SRBMiner-Multi.tar.gz
RUN tar xf SRBMiner-Multi.tar.gz
RUN rm -rf SRBMiner-Multi.tar.gz

WORKDIR /opt/SRBMiner-Multi-2-8-8/
RUN cd /opt/SRBMiner-Multi-2-8-8/

RUN chmod +x /opt/SRBMiner-Multi-2-8-8/SRBMiner-MULTI

ENTRYPOINT ["/opt/SRBMiner-Multi-2-8-8/SRBMiner-MULTI"]
CMD ["--algorithm", "sha3x", "--pool", "ca.luckypool.io:6118", "--wallet", "12BrRYQMCQkqQCodzQTJbg3nBvRP8n4wRPUHWxwKNQkHJU9VAKqxcrFyTXsdqAAhuvDEbeVRtPb4ZpPskrbUPzG3uRg=20G.salad]
