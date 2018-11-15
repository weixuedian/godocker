FROM golang:1.10-alpine3.7
# install xz and update
RUN apk update
RUN apk add --no-cache libcurl vim git tar upx


# create a working directory
WORKDIR /go/src/app

# add source code
ADD src src
# build the source
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main src/main.go


# add ca-certificates in case you need them
RUN apk add --no-cache ca-certificates
# set working directory
WORKDIR /root
# copy the binary from builder
COPY --from=builder /go/src/app/main .
# run the binary
CMD ["./main"]