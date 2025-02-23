FROM ruby:3.0.4

WORKDIR /app

RUN gem install rails -v '7.2.2.1'
