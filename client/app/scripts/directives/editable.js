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
      $scope.view = {
        editableValue: $scope.value,
        editorEnabled: false
      };

      $scope.enableEditor = function() {
        $scope.view.editorEnabled = true;
        $scope.view.editableValue = $scope.value;
      };

      $scope.disableEditor = function() {
        $scope.view.editorEnabled = false;
      };

      $scope.save = function() {
        console.log("Saving");
        $scope.value = $scope.view.editableValue;
        $scope.disableEditor();
      };
    }
  };
});
