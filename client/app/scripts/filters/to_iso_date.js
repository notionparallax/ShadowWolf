'use strict';

angular.module('ShadowWolf')
.filter('toISODate',function() {
  return function(input) {
    return new Date(input).toISOString();
  };
});
