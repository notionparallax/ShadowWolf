FROM ubuntu:latest

# Ruby
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C3173AA6 && \
  echo deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu trusty main > /etc/apt/sources.list.d/brightbox.list
# Node
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C7917B12 && \
  echo deb http://ppa.launchpad.net/chris-lea/node.js/ubuntu trusty main > /etc/apt/sources.list.d/nodejs.list

RUN apt-get update && apt-get install -y \
  git software-properties-common make python g++ \
  ruby2.1 ruby2.1-dev openjdk-7-jre-headless nodejs \
  --no-install-recommends
RUN gem2.1 install rails rake bundler compass --no-ri --no-rdoc
RUN npm update && npm install -g grunt-cli bower \
  phantomjs protractor
