FROM ruby:2.3-alpine

ENV APP "/opt/tell-me"

ADD Gemfile /tmp/
RUN apk add --update ruby-json ca-certificates g++ gcc bash make bash
RUN gem install bundle
WORKDIR /tmp/
RUN bundle install

RUN mkdir -p $APP
WORKDIR $APP
EXPOSE 8081
CMD ruby init.rb
