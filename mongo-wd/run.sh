#!/bin/bash

mongod &
mongod_pid=$!
sleep 2
echo checking for dump
if [[ -e shadow_wolf_production ]];
then
  echo dump found
  while true; do
    echo trying mongorestore...
    mongorestore --db shadow_wolf_development shadow_wolf_production && break
    sleep 1
  done
fi
echo waiting on mongod
wait $mongod_pid
