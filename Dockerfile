# syntax=docker/dockerfile:1

FROM golang:1.19-alpine AS build
WORKDIR /app
COPY go.mod ./
RUN go mod download
COPY *.go ./
RUN go build -o /app

FROM scratch
WORKDIR /
COPY --from=build /app /app
EXPOSE 8081
ENTRYPOINT [ "/app" ]