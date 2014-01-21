"use strict";

angular.module("ShadowWolf")
.directive("editable", function() {
  var editDisabled = false;
  return {
    restrict: "E",
    replace: true,
    templateUrl: 'scripts/directives/editable.html',
    scope: {
      label: "@",
      value: "@",
      name:  "@"
    },
    link: function (scope, element, attrs) { 
      if (attrs['editDisabled']) editDisabled = true;
    },
    controller: function($scope) {
      $scope.editableValue= $scope.value;
      $scope.editorEnabled= false;

      $scope.enableEditor = function() {
        if (editDisabled) return;
        $scope.editorEnabled = true;
        $scope.editableValue = $scope.value;
      };

      $scope.disableEditor = function() {
        $scope.editorEnabled = false;
      };

      $scope.save = function() {
        console.log('saving field: ' + $scope.label + ' as ' + $scope.value);
        $scope.value = $scope.editableValue;
        $scope.disableEditor();
      };
    }
  };
});
