'use strict';
angular.module('ShadowWolf')
.service('Oaf', function(Config, $http) {
  this.getProjectImageUrl = function(projectNumber, index, tag, size, cacheBust) {
    tag = tag || 'main';
    index = index || 0;
    size = size || 'small';
    cacheBust = cacheBust ? '?cache_bust=true' : '';
    return Config.getOaf() + '/' + projectNumber + '/' + tag + '/' + index + '/' + size + cacheBust;
  };
});
