FROM ruby:latest

RUN apt-get update && apt-get upgrade -y && apt-get install -y build-essential nodejs libxml2-dev libxslt1-dev libpq-dev apt-utils imagemagick \
	&& gem install bundle && gem install bundler && gem install rubygems-update && update_rubygems && gem update --system && gem update

RUN mkdir /myapp

WORKDIR /myapp

ADD Gemfile /myapp/Gemfile
RUN bundle install
