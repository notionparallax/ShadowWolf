#!/bin/sh

ENDPOINT="http://$SERVER_PORT_3000_TCP_ADDR:$SERVER_PORT_3000_TCP_PORT"
RETURNPOINT="http://phonelist.bvn.com.au:9000"
BEOWULF_SERVER="http://$SERVER_PORT_3000_TCP_ADDR:$BEOWULF_PORT_9001_TCP_PORT"
OAF_SERVER="http://$SERVER_PORT_3000_TCP_ADDR:$OAF_PORT_4567_TCP_PORT"
cat << EOF > /dist/scripts/endpoint.js
'use strict';
angular.module('ShadowWolf')
.constant('ENDPOINT', "$ENDPOINT")
.constant('RETURNPOINT', "$RETURNPOINT")
.constant('OAF_SERVER', "$OAF_SERVER")
.constant('BEOWULF_SERVER', "$BEOWULF_SERVER");
EOF
sed -ibak 's@</body>@<script src="scripts/endpoint.js"></script></body>@' /dist/index.html
cd /dist
exec python3 -m http.server 9000
