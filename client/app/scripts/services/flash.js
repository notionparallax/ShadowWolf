'use strict';

angular.module('ShadowWolf')
.service('Flash', function($timeout) {
  var _flashes = [];
  this.get = function() { return _flashes; };
  this.add = function(flash) {
    var _that = this;
    _flashes.push(flash);
    $timeout( function() {
      //_that.dismiss( flash );
    }, flash.timeout || 5000
    );
  };
  this.dismiss = function(flash) {
    var index = _flashes.indexOf(flash);
    if (index == -1) return;
    _flashes.splice(index,1);
  };

  this.add({ content: 'sup' });
});
