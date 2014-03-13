'use strict';

angular.module('ShadowWolf', ['infinite-scroll','ngResource','ngRoute', 'ngSanitize', 'ngCookies','config'])
  .config(function ($routeProvider, $httpProvider) {
    $httpProvider.defaults.useXDomain = true;
    delete $httpProvider.defaults.headers.common['X-Requested-With'];
    $routeProvider
      .when('/', {
        //templateUrl: 'views/main.html',
        redirectTo: '/people/'
      })
      .when('/people', {
        templateUrl: 'views/people/index.html',
        controller: 'PeopleIndexController'
      })
      .when('/people/:personId', {
        templateUrl: 'views/people/show.html',
        controller: 'PeopleShowController'
      })
      .when('/projects', {
        templateUrl: 'views/projects/index.html',
        controller: 'ProjectsIndexController'
      })
      .when('/projects/:projectId', {
        templateUrl: 'views/projects/show.html',
        controller: 'ProjectsShowController'
      })
      .when('/callback', {
        template: '<span></span>', // doesn't seem to work without some html
        controller: 'CallbackController'
      })
      .otherwise({
        redirectTo: '/people/'
      });
  });
