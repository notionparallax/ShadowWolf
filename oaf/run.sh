#!/bin/sh

cp /oaf/redis-dump.rdb /var/lib/redis/dump.rdb
redis-server /etc/redis/redis.conf
ruby main.rb
