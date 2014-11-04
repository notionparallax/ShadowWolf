'use strict';

angular.module('ShadowWolf')
.service('Session', function(ipCookie) {
  var _accessToken = '_accessToken',
      _personId = '_personId',
      _login = '_login';
  function get(key) { return ipCookie(key); }
  function set(key,value) { return ipCookie(key,value,{expires:30}); } // days

  this.getAccessToken = function() { return get(_accessToken); };
  this.setAccessToken = function(accessToken) { set(_accessToken, accessToken); };

  this.getPersonId = function() { return get(_personId); };
  this.setPersonId = function(personId) { set(_personId, personId); };

  this.getPersonLogin = function() { return get(_login); };
  this.setPersonLogin = function(login) { set(_login, login); };

  this.logout = function() {
    set(_accessToken, '');
    set(_personId, '');
    set(_login, '');
  };

  // Used by editable directive before enabling editor
  this.authorize = function() {
    return {
      success: false,
      errorMessage: '<p>You don\'t have permission to do that.</p>'
    };
  };
});
