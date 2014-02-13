'use strict';

angular.module('ShadowWolf')
.service('Flash', function($timeout, $compile) {
  var _flashes = [];
  this.get = function() { return _flashes; };
  this.add = function(flash) {
    var _that = this;
    _flashes.splice(0,0,flash);

    return {
      timeout: function(duration) {
        $timeout( function() {
          _that.dismiss( flash );
        }, duration || 5000
        );
      }
    };
  };
  this.dismiss = function(flash) {
    var index = _flashes.indexOf(flash);
    if (index == -1) return;
    _flashes.splice(index,1);
  };
});
