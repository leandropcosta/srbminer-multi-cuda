FROM nvidia/cuda:11.8.0-runtime-ubuntu22.04

ENV ALGO="sha3x"
ENV POOL_ADDRESS="ca.luckypool.io:6118"
ENV WALLET_USER="12BrRYQMCQkqQCodzQTJbg3nBvRP8n4wRPUHWxwKNQkHJU9VAKqxcrFyTXsdqAAhuvDEbeVRtPb4ZpPskrbUPzG3uRg"

RUN apt-get -y update \
    && apt-get -y upgrade
RUN cd /opt/

WORKDIR /opt/
COPY SRBMiner-MULTI .
COPY mine.sh .

RUN chmod +x SRBMiner-MULTI
RUN chmod +x mine.sh

EXPOSE 80

ENTRYPOINT ["./SRBMiner-MULTI"]
CMD ["-algorithm", "randomx", "--pool", "mine-tari-monero.luckypool.io:8118", "--wallet", "12D1CtJnkqS4CMCFY2No5xeUWpzjH1rZkGHyZoHqYV14aE9mLLVyeuZj1siCh4gsMJgVZKa5aCraZGTEjB5n3oQjm2Y+47XpnLL3raj7aTCAdXFhHZUcNhumxcxfc2mvwVmFfL6udAGzuhZQExpSVyJj3yPbgLDoudJg2acaZdHdfziAbBB81RDzo89.salad"]
