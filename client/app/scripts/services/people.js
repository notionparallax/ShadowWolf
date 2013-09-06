'use strict';

angular.module('ShadowWolf')
.service('People', function($resource) {
  var _People = $resource('http://localhost:port/people.json', { port: ':3000' });
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
