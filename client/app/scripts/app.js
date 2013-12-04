'use strict';

angular.module('ShadowWolf', ['ngResource','ngRoute', 'ngSanitize'])
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/main.html',
      })
      .when('/people', {
        templateUrl: 'views/people/index.html',
        controller: 'PeopleIndexController'
      })
      .when('/people/:id', {
        templateUrl: 'views/people/show.html',
        controller: 'PeopleShowController'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
