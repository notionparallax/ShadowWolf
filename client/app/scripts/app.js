'use strict';

angular.module('ShadowWolf', ['ngResource','ngRoute', 'ngSanitize'])
  .config(function ($routeProvider, $httpProvider) {
    $httpProvider.defaults.useXDomain = true;
    delete $httpProvider.defaults.headers.common['X-Requested-With'];
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
      .when('/callback', {
        template: '<span></span>', // doesn't seem to work without some html
        controller: 'CallbackController'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
