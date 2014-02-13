'use strict';

angular.module('ShadowWolf')
.directive('flash',function(Flash) {
  return {
    restrict: 'E',
    replace: true,
    templateUrl: 'scripts/directives/flash.html',
    controller: function($scope) {
      $scope.getFlashes = Flash.get;
      $scope.dismiss = Flash.dismiss;
    }
  };
});
