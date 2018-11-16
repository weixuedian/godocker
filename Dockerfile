﻿FROM golang:latest
# install  and update
#RUN apk update
#RUN apk add --no-cache libcurl vim git tar upx 

#RUN apk add --no-cache ca-certificates
USER root
ENV GOPATH /go
ENV PATH ${GOPATH}/bin:$PATH

# create a working directory
WORKDIR /go/src/app

# add source code
ADD src /opt
# install docker
RUN cd /opt \
    && tar zxvf docker-latest.tgz \
    && cp docker/docker /usr/local/bin/ \
    && rm -rf docker docker-latest.tgz

# run the binary
#CMD ["echo","hello world"]
RUN apt-get update
RUN apt-get -y --fix-missing install tcl tk expect vim git tar 