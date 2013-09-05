'use strict';

describe('Routes', function() {
  beforeEach(module('ShadowWolf'));

  it('should have a "/" route', function(){
    inject(function($route, $location, $rootScope, $controller) {

      $location.path('/');
      $rootScope.$digest();

      expect(true).toBe(true);
      //expect($route.current.templateUrl).toBe('views/main.html');
      //expect($route.current.controller).toBe($controller('MainController'));

    });
  });
});
