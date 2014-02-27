'use strict';

angular.module('ShadowWolf')
.filter('id',function() {
  return function(input) {
    return input.id['$oid'];
  };
});
