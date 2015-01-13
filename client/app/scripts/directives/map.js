'use strict';

angular.module('ShadowWolf')
.directive('swNgMap', function(Models, Lens, Flash) {
  return {
    restrict: 'E',
    replace: true,
    template: '<sw-map latitude="{{lat}}" longitude="{{lon}}"></sw-map>',
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
      $scope.onChange = function(latLon) {
        console.log(latLon);
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
