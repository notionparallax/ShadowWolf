FROM ShadowWolf_devBase

ADD server/Gemfile /ShadowWolf/server/Gemfile
ADD server/Gemfile.lock /ShadowWolf/server/Gemfile.lock
ADD client/package.json /ShadowWolf/client/package.json
ADD client/bower.json /ShadowWolf/client/bower.json

RUN cd /ShadowWolf/client && npm install
RUN cd /ShadowWolf/server && bundle install
