FROM golang:alpine AS build

WORKDIR /go/src/app

ADD src/ .
RUN go mod init

RUN go build -ldflags="-s -w" -o ./hello

FROM scratch

WORKDIR /var

COPY --from=build /go/src/app/hello /var

ENTRYPOINT ["/var/hello"]