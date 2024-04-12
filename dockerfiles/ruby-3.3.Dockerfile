FROM ruby:3.3-alpine

RUN apk add --no-cache --upgrade 'curl>=7.66'
RUN apk add --no-cache --upgrade 'curl-dev>=7.66'

ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="Gemfile,Gemfile.lock"

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install --verbose
