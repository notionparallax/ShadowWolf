'use strict';

angular.module('ShadowWolf')
.service('Beowulf', function($resource, $http, Session, Config, $q) {
  var cache = { projects: {}, people: {} };
  this.getProjectNumbers = function(login) {
    if (login === undefined) return {};
    if (cache.projects[login]) return cache.projects[login];
    cache.projects[login] = [];
    $http.get(Config.getBeowulf() + '/get_projects/' + login)
      .then(function(result) {
        cache.projects[login] = result.data.projects;
      });
    return cache.projects[login];
  };
  this.getPeopleLogins = function(projectNumber) {
    if (projectNumber === undefined) return {};
    if (cache.people[projectNumber]) return cache.people[projectNumber];
    cache.people[projectNumber] = [];
    $http.get(Config.getBeowulf() + '/get_people/' + projectNumber)
      .then(function(result) {
        cache.people[projectNumber] = result.data.people;
      });
    return cache.people[projectNumber];
  };
});
