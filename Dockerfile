FROM nvidia/cuda:11.8.0-runtime-ubuntu22.04

ENV ALGO="sha3x"
ENV POOL_ADDRESS="ca.luckypool.io:6118"
ENV WALLET_USER="12BrRYQMCQkqQCodzQTJbg3nBvRP8n4wRPUHWxwKNQkHJU9VAKqxcrFyTXsdqAAhuvDEbeVRtPb4ZpPskrbUPzG3uRg"

RUN apt-get -y update \
    && apt-get -y upgrade
RUN cd /opt 

WORKDIR /opt/
COPY SRBMiner-MULTI.sh .

RUN chmod +x SRBMiner-MULTI

EXPOSE 80

ENTRYPOINT ["./SRBMiner-MULTI"]
CMD ["-algorithm", "sha3x", "--pool", "ca.luckypool.io:6118", "--wallet", "12BrRYQMCQkqQCodzQTJbg3nBvRP8n4wRPUHWxwKNQkHJU9VAKqxcrFyTXsdqAAhuvDEbeVRtPb4ZpPskrbUPzG3uRg=50G.salad"]
