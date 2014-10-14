FROM ubuntu
RUN apt-get update
RUN apt-get install -y python-software-properties make python g++
RUN add-apt-repository -y ppa:chris-lea/node.js && apt-get update
RUN apt-get install -y nodejs
RUN export PATH=$PATH:/usr/lib/node_modules
RUN npm update
RUN npm install -g grunt-cli bower
