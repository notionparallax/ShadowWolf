'use strict';
angular.module('ShadowWolf')
.service('Oaf', function(Config, $http) {
  this.getProjectImageUrl = function(projectNumber, index, tag, size) {
    tag = tag || 'main';
    index = index || 0;
    size = size || 'small';
    return Config.getOaf() + '/' + projectNumber + '/' + tag + '/' + index + '/' + size;
  };
});
