'use strict';
angular.module("template/tabs/tabset.html", []).run(["$templateCache", function($templateCache) {
  $templateCache.put("template/tabs/tabset.html",
    "\n" +
    "<div class=\"tabbable\">\n" +
    "  <ul class=\"nav {{type && 'nav-' + type}}\" ng-class=\"{'nav-stacked': vertical, 'nav-justified': justified}\" ng-transclude></ul>\n" +
    "  <div class=\"tab-content\">\n" +
    "    <div class=\"tab-pane\" \n" +
    "         ng-repeat=\"tab in tabs\" \n" +
    "         ng-if=\"tab.active\" \n" +
    "         ng-class=\"{active: tab.active}\"\n" +
    "         tab-content-transclude=\"tab\">\n" +
    "    </div>\n" +
    "  </div>\n" +
    "</div>\n" +
    "");
}]);

angular.module('ShadowWolf', ['ngResource',
                              'ngRoute',
                              'ngSanitize',
                              'config',
                              'ui.bootstrap',
                              'angulartics',
                              'angulartics.google.analytics',
                              'contenteditable'])
  .config(function ($routeProvider, $httpProvider, $analyticsProvider) {
    $httpProvider.defaults.useXDomain = true;
    delete $httpProvider.defaults.headers.common['X-Requested-With'];
    $routeProvider
      .when('/', {
        //templateUrl: 'views/main.html',
        redirectTo: '/people/'
      })
      .when('/people', {
        templateUrl: 'views/people/index.html',
        reloadOnSearch: false,
        controller: 'PeopleIndexController'
      })
      .when('/people/:login', {
        templateUrl: 'views/people/show.html',
        controller: 'PeopleShowController'
      })
      .when('/projects', {
        templateUrl: 'views/projects/index.html',
        reloadOnSearch: false,
        controller: 'ProjectsIndexController'
      })
      .when('/projects/new', {
        templateUrl: 'views/projects/new.html',
        controller: 'ProjectsNewController'
      })
      .when('/projects/:projectNumber', {
        templateUrl: 'views/projects/show.html',
        controller: 'ProjectsShowController'
      })
      .when('/callback/', {
        template: '<span></span>', // doesn't seem to work without some html
        controller: 'CallbackController'
      })
      .when('/extras', {
        templateUrl: 'views/extras/index.html',
        controller: 'ExtrasController'
      })
      .when('/changelog', {
        templateUrl: 'views/changelog/index.html',
        controller: 'ChangeLogController'
      })
      .otherwise({
        redirectTo: '/people/'
      });
  })
  .run(function(ENV){
    switch (ENV) {
      case 'development': ga('create', 'UA-93352-16','auto'); break;
      case 'production': ga('create', 'UA-93352-17','auto'); break;
    }
  });
