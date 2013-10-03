"use strict";

angular.module("ShadowWolf")
.directive("editable", function() {
  return {
    restrict: "E",
    replace: true,
    templateUrl: 'scripts/directives/editable.html',
    scope: {
      label: "@",
      value: "@" 
    },
    link: function (scope, element, attrs) { 
     
    },
    controller: function($scope) {
      $scope.editableValue= $scope.value;
      $scope.editorEnabled= false;

      $scope.enableEditor = function() {
        $scope.editorEnabled = true;
        $scope.editableValue = $scope.value;
      };

      $scope.disableEditor = function() {
        $scope.editorEnabled = false;
      };

      $scope.save = function() {
        $scope.value = $scope.editableValue;
        $scope.disableEditor();
      };
    }
  };
});
