FROM golang:alpine as builder

RUN apk --no-cache add ca-certificates
RUN apk update
RUN apk upgrade
RUN apk add --no-cache git
WORKDIR /root/
# Latest commit: https://github.com/alexaandru/go3up/commit/d5c9306edb5290be3b481de37ed4892038c9fd8e
RUN go get -v github.com/alexaandru/go3up
RUN which go3up

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=builder /go/bin/go3up /usr/local/bin/go3up
