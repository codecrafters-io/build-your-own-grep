FROM golang:1.19-alpine

WORKDIR /app

COPY . .

RUN go build -o /dev/null ./cmd/mygrep

RUN rm -rf /app
