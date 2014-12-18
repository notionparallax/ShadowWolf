#!/bin/sh

redis-server /etc/redis/redis.conf
ruby main.rb
