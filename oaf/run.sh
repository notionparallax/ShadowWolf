#!/bin/sh

#cp /oaf/redis-dump.rdb /var/lib/redis/dump.rdb
redis-server /etc/redis/redis.conf
rackup -o 0.0.0.0 -p 4567
