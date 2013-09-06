'use strict';

angular.module('ShadowWolf', ['ngResource'])
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/main.html',
      })
      .when('/people', {
        templateUrl: 'views/people/index.html',
        controller: 'PeopleIndexController'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
