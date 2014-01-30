'use strict';

angular.module('ShadowWolf')
.service('Person', function($resource, $http, Session, $q, $rootScope) {
  $http.defaults.useXDomain = true;
  
  var _Person = $resource('http://10.1.3.70:port/people/:personId.json?access_token=:accessToken',
    { port: ':3000', personId: '@personId', accessToken: Session.getAccessToken() },
    {
      'get':    {method:'GET'},
      'save':   {method:'POST'},
      'update': {method:'PATCH'},
      'query':  {method:'GET', isArray:true},
      'remove': {method:'DELETE'},
      'delete': {method:'DELETE'}
    });
  this.getPerson = function(personId) { return _Person.get({personId: personId}); };
  this.update = function(id,postData,success,error) {
    return _Person.update({ personId: id }, postData, success, error);
  };
});
