# Use the official Golang image to create a build artifact.
FROM golang:1.22-alpine as builder

# This stage installs CompileDaemon for hot reloading.
RUN apk add --no-cache git
RUN go install github.com/githubnemo/CompileDaemon@latest

WORKDIR /app

# Force the go compiler to use modules
ENV GO111MODULE=on

# We want to populate the module cache based on the go.{mod,sum} files.
COPY go.mod .
COPY go.sum .

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

COPY . .

# CompileDaemon will run our Go program, monitor for file changes and recompile & rerun the program
ENTRYPOINT CompileDaemon --build="go build -o hobbiton" --command=./hobbiton
