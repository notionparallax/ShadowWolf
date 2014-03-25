'use strict';

angular.module('ShadowWolf')
.filter('id',function() {
  return function(input) {
    return (input.id ||{ '$oid':''})['$oid'];
  };
});

angular.module('ShadowWolf')
.filter('trustMaplink',function($sce) {
  return function(input) {
  	window.x = $sce.trustAsUrl(input);
    return $sce.trustAsUrl(input).$$unwrapTrustedValue();
  };
});



angular.module('ShadowWolf').config(function($sceDelegateProvider) {
 $sceDelegateProvider.resourceUrlWhitelist([
   // Allow same origin resource loads.
   'self',
   // Allow loading from our assets domain.  Notice the difference between * and **.
   'https://maps.google.com.au/**']);
 });