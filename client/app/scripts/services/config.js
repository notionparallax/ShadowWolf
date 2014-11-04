'use strict';

angular.module('ShadowWolf')
.service('Config', function(ENV, ENDPOINT, RETURNPOINT, BEOWULF_SERVER) {
  var _endPoint = ENDPOINT;
  this.getEndPoint = function() { return _endPoint; };

  var _returnPoint =
    ENV == 'production'  ? RETURNPOINT :
    ENV == 'development' ? 'http://localhost:9000' :
    undefined;
  this.getReturnPoint = function() { return _returnPoint; };
  this.getBeowulf = function() {
    console.log('Rawwrr, I am Beowulf!');
    return BEOWULF_SERVER;
  };
});
