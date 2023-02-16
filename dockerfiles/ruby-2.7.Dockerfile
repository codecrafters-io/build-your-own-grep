FROM ruby:2.7-alpine

RUN apk add --update-cache --upgrade curl
RUN apk add --update-cache --upgrade curl-dev

WORKDIR /app
