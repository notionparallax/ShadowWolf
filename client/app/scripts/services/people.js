'use strict';

angular.module('ShadowWolf')
.service('People', function($resource, $http) {
  $http.defaults.useXDomain = true;
  var _People = $resource('http://fathomless-oasis-7708.herokuapp.com/people.json');
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
