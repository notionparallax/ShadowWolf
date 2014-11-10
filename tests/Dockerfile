FROM shadowwolf_dev

RUN apt-get install -y autoconf openssl ca-certificates build-essential
ADD Gemfile /ShadowWolf/tests/Gemfile
RUN cd /ShadowWolf/tests && bundle install
