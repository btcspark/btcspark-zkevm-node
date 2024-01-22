# CONTAINER FOR BUILDING BINARY
FROM golang:1.21 AS build

# INSTALL DEPENDENCIES
RUN go install github.com/gobuffalo/packr/v2/packr2@v2.8.3
RUN apt update && apt install -y git
COPY go.mod go.sum /src/
WORKDIR /src
RUN go mod download

# BUILD BINARY
COPY . /src/
RUN cd /src/db && packr2
RUN cd /src && make build
RUN find /src/dist

# CONTAINER FOR RUNNING BINARY
FROM alpine:3.18.0
COPY --from=build /src/dist/zkevm-node /app/zkevm-node
COPY --from=build /src/config/environments/testnet/node.config.toml /app/example.config.toml
RUN apk update && apk add postgresql15-client
EXPOSE 8123
CMD ["/app/zkevm-node"]
