'use strict';

angular.module('ShadowWolf')
.service('SearchScopeLinker', function($routeParams,$location) {
  this.link = function(scope, scopeVariable, searchParam) {
    scope.$watch(scopeVariable, function(newValue) {
      $location.search(searchParam,newValue);
    });
    scope.$on('$routeUpdate', function($event, route) {
      this[scopeVariable] = route.params[searchParam];
    }.bind(scope));
  };
});
