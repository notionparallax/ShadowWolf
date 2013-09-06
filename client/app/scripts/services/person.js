'use strict';

angular.module('ShadowWolf')
.service('Person', function($resource) {
  var person;
  this.setPerson = function(personId) {
    person = $resource('http://localhost:port/people/:personId.json', { personId: personId, port: ':3000' });
  };

  this.getPerson = function() { return person; };
});
