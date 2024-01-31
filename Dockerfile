FROM golang:alpine as build
WORKDIR /go/bin
ADD . .
RUN CGO_ENABLED=0 GOOSlinux GOARCH=amd64 go build

FROM scratch
COPY --from=build /go/bin/docker-demo-2 /go/bin/docker-demo-2
ENTRYPOINT [ "go/bin/docker-demo-2" ]
EXPOSE 9000