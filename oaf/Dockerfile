FROM ubuntu:14.04
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C3173AA6 && \
  echo deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu trusty main > /etc/apt/sources.list.d/brightbox.list
RUN apt-get update && apt-get install -y ruby2.1 ruby2.1-dev build-essential \
  openssl libreadline6 libreadline6-dev git-core libyaml-dev libssl-dev zlib1g \
  redis-server zlib1g-dev
RUN gem2.1 install sinatra rake bundler rest-client redis mocha rack rack-test --no-ri --no-rdoc
ENV LANG en_AU.utf8
ENV LANGUAGE en_AU.UTF-8
ENV LC_ALL en_AU.UTF-8
ADD . /oaf
