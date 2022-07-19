## Build a go binary with dynamic dependencies
FROM docker.io/golang:1.17 AS build

COPY test.go .
RUN go build -o test ./test.go

## Put the binary into the stock-util image
FROM ghcr.io/jmanero/stock-util:go-fc36
COPY --from=build /go/test .
ENTRYPOINT [ "/test" ]
