FROM golang:latest
# install  and update
# RUN apk update
# RUN apk add --no-cache libcurl vim git tar upx 

# RUN apk add --no-cache ca-certificates
USER root
ENV GOPATH /go
ENV PATH ${GOPATH}/bin:$PATH
ENV TZ=Asia/Shanghai


# create a working directory
WORKDIR $GOPATH/src/bbs
#拷贝文件授权
COPY entry.sh /go/src/entry.sh
RUN chmod a+x /go/src/entry.sh
#设置时区
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone

VOLUME = ["/cache","/opt/gitlabci/.m2:/root/.m2","/opt/gitlabci/builds:/builds","/go/src:/go/src":]
# run the binary
# CMD ["echo","hello world"]
# RUN apt-get update
# RUN apt-get -y install vim git
# RUN go build main.go
EXPOSE 8080

# CMD ["/bin/bash"]
#ENTRYPOINT ["bash /go/src/entry.sh"]

CMD /go/src/entry.sh