'use strict';

angular.module('ShadowWolf')
.directive('swNgMap', function(Models, Lens, Flash) {
  return {
    restrict: 'E',
    replace: true,
    template: '<sw-map latitude="{{latitude()}}" longitude="{{longitude()}}"></sw-map>',
    scope: {
      project: '=',
      locationId: '=',
      onChange: '&',
      lat: '=',
      lon: '='
    },
    link: function(scope,element,attrs) {
      element[0].addEventListener('latLongSelected', function(event) {
        scope.onChange(event.detail);
        scope.$digest();
      });
    },
    controller: function($scope) {
      $scope.latitude = function() {
        // max lat is 85, see:
        // http://stackoverflow.com/questions/11849636/maximum-lat-and-long-bounds-for-the-world-google-maps-api-latlngbounds
        if (typeof $scope.lat !== 'number' || Math.abs($scope.lat) <= 85) {
          return -33.86;
        } else return $scope.lat;
      };
      $scope.longitude = function() {
        if (typeof $scope.lon !== 'number' || Math.abs($scope.long) <= 180) {
          return 151.21;
        } else return $scope.lon;
      };
      $scope.onChange = function(latLon) {
        var updateObject = {
          project: {
            building: {
              locations: [
              { id: $scope.locationId,
                geo_json: {
                  lat: latLon.lat,
                  lon: latLon.lng
                }
              }]
            }
          }
        };
        var flash = {
          template: '<p>Updating Latitude and Longitude...</p>',
        };
        var handle = Flash.add(flash);
        Models.update('project')( $scope.project.id['$oid'],
            updateObject,
            function() {
              flash.template = '<p>Updated Latitude and Longitude.</p>';
              flash.css = 'flash-success';
              handle.timeout(3000);
              var lens = 'building.locations[' + $scope.locationId + '].geo_json';
              Lens.set($scope.project, lens + '.lat', latLon.lat);
              Lens.set($scope.project, lens + '.lon', latLon.lng);
            }, function() {
              flash.template = '<p>Update unsuccessful for latitude and longitude. There may be a connection problem.</p>';
              flash.css = 'flash-failure';
              handle.timeout(5000);
            }
          );
      };
    }
  };
});
