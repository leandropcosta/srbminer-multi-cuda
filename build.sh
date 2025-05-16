#!/bin/bash
version="2.4.7"
image="srbminer-multi-cuda-le"
docker build . --tag docker.io/lpc86/$image:$version
docker tag docker.io/lpc86/$image:$version docker.io/cniweb/$image:latest
docker push docker.io/cniweb/$image:$version
docker push docker.io/cniweb/$image:latest
