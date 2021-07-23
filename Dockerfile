# notenote:latest

# Build stage
FROM golang:1.16-alpine3.13 AS builder
WORKDIR /app

COPY go.mod . 
# <- COPY go.mod and go.sum files to the workspace
COPY go.sum .

# Get dependancies - will also be cached if we won't change mod/sum
RUN go mod download

COPY . .
RUN go build -o main main.go

# Run stage
FROM alpine:3.13
WORKDIR /app
COPY --from=builder /app/main .

EXPOSE 8080
CMD [ "/app/main" ]

