FROM phusion/passenger-ruby21:latest

ADD Gemfile /home/app/server/Gemfile
ADD Gemfile.lock /home/app/server/Gemfile.lock
RUN cd /home/app/server && bundle install
ADD . /home/app/server
