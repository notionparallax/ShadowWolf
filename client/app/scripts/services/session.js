'use strict';

angular.module('ShadowWolf')
.service('Session', function($cookieStore) {
  var _accessToken = '_accessToken',
      _personId = '_personId',
      _login = '_login';
  //TODO use cookies or some other more permanent store than memory
  this.getAccessToken = function() { return $cookieStore.get(_accessToken); };
  this.setAccessToken = function(accessToken) { $cookieStore.put(_accessToken, accessToken); };

  this.getPersonId = function() { return $cookieStore.get(_personId); };
  this.setPersonId = function(personId) { $cookieStore.put(_personId, personId); };

  this.getPersonLogin = function() { return $cookieStore.get(_login); };
  this.setPersonLogin = function(login) { $cookieStore.put(_login, login); };

  this.logout = function() {
    $cookieStore.put(_accessToken, '');
    $cookieStore.put(_personId, '');
    $cookieStore.put(_login, '');
  };
});
