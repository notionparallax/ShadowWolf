"use strict";

angular.module("ShadowWolf")
.directive("editable", function(Lens) {
  var editDisabled = false;
  return {
    restrict: "E",
    replace: true,
    templateUrl: 'scripts/directives/editable.html',
    scope: {
      label: "@",
      object: "=",
      objectName: "@object",
      lens:  "@"
    },
    link: function (scope, element, attrs) { 
      if (attrs['editDisabled']) editDisabled = true;
    },
    controller: function($scope) {
      $scope.editableValue= $scope.value;
      $scope.editorEnabled= false;

      $scope.get = Lens.get;
      $scope.set = Lens.set;

      $scope.getName = function() {
        var name = $scope.objectName;
        var props = $scope.lens.split('.');
        for (var prop in props) {
          name += "[" + props[prop] + "]";
        }
        return name;
      };

      $scope.enableEditor = function() {
        if (editDisabled) return;
        $scope.editorEnabled = true;
        $scope.editableValue = Lens.get($scope.object, $scope.lens);
      };

      $scope.disableEditor = function() {
        $scope.editorEnabled = false;
      };

      $scope.save = function() {
        console.log('saving field: ' + $scope.label + ' as ' + $scope.value);
        $scope.value = $scope.editableValue;
        $scope.disableEditor();
      };
      $scope.cancel = function() {
        $scope.disableEditor();
      };
    }
  };
});
