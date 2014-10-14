FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
  git software-properties-common make python g++ \
  ruby2.0 ruby2.0-dev openjdk-7-jre-headless \
  --no-install-recommends
RUN echo gem: --no-rdoc --no-ri > .gemrc
RUN add-apt-repository -y ppa:chris-lea/node.js && \
  apt-get update && apt-get install -y nodejs
RUN gem2.0 install rails bundler compass --no-ri --no-rdoc
RUN npm update && npm install -g grunt-cli bower \
  phantomjs protractor
