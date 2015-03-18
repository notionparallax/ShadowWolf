'use strict';

angular.module('ShadowWolf')
.service('Person', function($resource, $http, Session, Config) {
  $http.defaults.useXDomain = true;
  
  var _Person = $resource(Config.getEndPoint() + '/people/:personIdOrLogin.json?access_token=:accessToken',
    { personIdOrLogin: '@personIdOrLogin', accessToken: Session.getAccessToken() },
    {
      'get':    {method:'GET'},
      'save':   {method:'POST'},
      'update': {method:'PATCH'},
      'query':  {method:'GET', isArray:true},
      'remove': {method:'DELETE'},
      'delete': {method:'DELETE'}
    });
  var _person;
  this.get = function(personId) { 
    if (!_person || (_person.id && (personId != _person.id.$oid))) {
      _person = _Person.get({personIdOrLogin: personId});
    }
    return _person;
  };
  this.getByLogin = function(login) {
    if (!_person || (_person.employee && _person.employee.login !== login)) {
      _person = _Person.get({personIdOrLogin: login});
    }
    return _person;
  };
  this.set = function(person) {
    _person = person;
  };
  this._get = function() { return _Person; };
});
