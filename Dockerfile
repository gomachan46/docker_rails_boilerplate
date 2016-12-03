FROM ruby:2.3.3
RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev nodejs mysql-client
RUN mkdir /myapp

##Cache bundle install#################
WORKDIR /tmp
ADD ./Gemfile Gemfile
ADD ./Gemfile.lock Gemfile.lock
RUN bundle install
#######################################

WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp
