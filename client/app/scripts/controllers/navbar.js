'use strict';

angular.module('ShadowWolf')
.controller('NavbarController', function($scope, Session, Config, $location) {
  $scope.loggedIn = function() { return !!Session.getAccessToken(); };
  $scope.logout = function() {  };

  $scope.getLogInLink = function() {
    return Config.getEndPoint() 
      + '/people/auth/ldap?redirect_uri='
      + encodeURIComponent( 
          Config.getReturnPoint()
          + '/#/callback?path=' + $location.path()
        )
  };

  $scope.isActive = function(viewLocation) {
    return viewLocation == $location.path();
  };
});
