#!/bin/bash

case $1 in
  rails)
    rm -f server/tmp/pids/server.pid
    cd server && MONGO_PORT_27017_TCP_ADDR=localhost MONGO_PORT_27017_TCP_PORT=27017 rails server
  ;;
  webdriver)
    webdriver-manager start
  ;;
  grunt)
    cd client && SERVER_PORT_3000_TCP_ADDR=localhost SERVER_PORT_3000_TCP_PORT=3000 grunt server
  ;;
  protractor)
    SUITE=`test -n "$2" && echo $2 || echo all`
    cd client && CLIENT_PORT_9000_TCP_ADDR=localhost CLIENT_PORT_9000_TCP_PORT=9000 WEBDRIVER_PORT_4444_TCP_ADDR=localhost WEBDRIVER_PORT_4444_TCP_PORT=4444 protractor Protractor.js --suite $SUITE
  ;;
esac
