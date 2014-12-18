'use strict';

angular.module('ShadowWolf')
.service('Config', function(ENV, ENDPOINT, RETURNPOINT, BEOWULF_SERVER, OAF_SERVER) {
  var _endPoint = ENDPOINT;
  this.getEndPoint = function() { return _endPoint; };

  var _returnPoint =
    ENV == 'production'  ? RETURNPOINT :
    ENV == 'development' ? 'http://localhost:9000' :
    undefined;
  this.getReturnPoint = function() { return _returnPoint; };
  this.getBeowulf = function() { return BEOWULF_SERVER; };
  this.getOaf = function() { return OAF_SERVER; }
});
