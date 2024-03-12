FROM ruby:3.2-alpine

RUN apk add --no-cache --upgrade 'curl>=7.66'
RUN apk add --no-cache --upgrade 'curl-dev>=7.66'

WORKDIR /app
