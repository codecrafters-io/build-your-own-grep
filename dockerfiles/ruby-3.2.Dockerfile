FROM ruby:3.2-alpine

RUN apk add --update-cache --upgrade curl
RUN apk add --update-cache --upgrade curl-dev

WORKDIR /app
