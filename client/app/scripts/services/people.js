'use strict';

angular.module('ShadowWolf')
.service('People', function($resource, $http, Session) {
  $http.defaults.useXDomain = true;
  // todo follow advice here or similar
  //  http://stackoverflow.com/questions/18415912/configure-restangular-baseurl-using-gruntjs
  // to get enviromnet agnostic code. Also abstract it into a service somewhere.
  var _People = $resource('http://localhost:port/people.json', { port: ':3000' });
  //                      'http://fathomless-oasis-7708.herokuapp.com/people.json');
  //*                      localhost:3000*/
  var _people = _People.query();
  this.getPeople = function() { return _people; };
  this.getPerson = function(id) {
    for (var p in _people) {
      var person = _people[p];
      if (person.id['$oid'] === id) {
        return person;
      }
    }
  };
});
