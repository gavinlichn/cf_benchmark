#FROM zhangxiaoyu99936/mygo:release-branch.go1.17-falseshared
FROM golang:1.17
ENV http_proxy http://proxy-dmz.intel.com:912
ENV https_proxy http://proxy-dmz.intel.com:912

COPY . /go/src/cf_benchmark

RUN export GOPATH="$GOPATH"; \
    go env -w GO111MODULE="off"; \
    cd /go/src/cf_benchmark; \
    go get -u golang.org/x/crypto/chacha20poly1305; \
    go build -o go_benchmarkss -ldflags="-s -w" go_benchmarklp.go \
    apt update; \
    apt install -y vim
