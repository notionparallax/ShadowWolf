'use strict';

angular.module('ShadowWolf')
.controller('NavbarController', function($scope, Session, Config) {
  $scope.loggedIn = function() { return !!Session.getAccessToken(); };
  $scope.logout = function() { console.log('logout'); Session.logout(); };

  $scope.getLogInLink = function() {
    return Config.getEndPoint() 
      + '/people/auth/ldap?redirect_uri='
      + encodeURIComponent( 
          Config.getReturnPoint()
          + '/#/callback'
        )
  };
});
