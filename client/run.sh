#!/bin/sh

ENDPOINT="http://$SERVER_PORT_3000_TCP_ADDR:$SERVER_PORT_3000_TCP_PORT"
cat << EOF > dist/scripts/endpoint.js
'use strict';
angular.module('ShadowWolf')
.constant('ENDPOINT', "$ENDPOINT");
EOF
sed -ibak 's@</body>@<script src="scripts/endpoint.js"></script></body>@' dist/index.html
exec grunt connect:dist:keepalive
