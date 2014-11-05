'use strict';

angular.module('ShadowWolf')
.filter('getProjectFromProjectNumber', function(Projects) {
  return Projects.getProject;
});
