'use strict';

angular.module('ShadowWolf')
.service('People', function($resource) {
  this.People = $resource('http://localhost:port/people.json', { port: ':3000' });
});
