'use strict';

angular.module('ShadowWolf')
.filter('toISODate',function() {
  return function(input) {
    return input ? new Date(input).toISOString() : null;
  };
});
