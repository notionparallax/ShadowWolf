FROM shadowwolf_devbase

ADD server/Gemfile /ShadowWolf/server/Gemfile
ADD server/Gemfile.lock /ShadowWolf/server/Gemfile.lock
ADD client/package.json /ShadowWolf/client/package.json
ADD client/bower.json /ShadowWolf/client/bower.json
ADD beowulf/requirements.txt /ShadowWolf/beowulf/requirements.txt

RUN cd /ShadowWolf/client && npm update && npm install -g npm@3.2.1 && npm install --no-bin-link
RUN cd /ShadowWolf/server && bundle install
RUN cd /ShadowWolf/beowulf && pip3 install -r requirements.txt
