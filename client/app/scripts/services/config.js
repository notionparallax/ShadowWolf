'use strict';

angular.module('ShadowWolf')
.service('Config', function(ENV, ENDPOINT) {
  var _endPoint = ENDPOINT;
  this.getEndPoint = function() { return _endPoint; };

  var _returnPoint =
    ENV == 'production'  ? 'http://10.1.3.70:8000' :
    ENV == 'development' ? 'http://localhost:9000' :
    undefined;
  this.getReturnPoint = function() { return _returnPoint; };
});
