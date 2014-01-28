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
      lens:  "@",
      updatePerson: "&"
    },
    link: function (scope, element, attrs) { 
      if (attrs['editDisabled']) editDisabled = true;
    },
    controller: function($scope) {
      $scope.editableValue= $scope.value;
      $scope.editorEnabled= false;

      $scope.get = Lens.get;
      $scope.set = Lens.set;

      // Get the name for the laben and input tag
      $scope.getName = function() {
        var name = $scope.objectName;
        var props = $scope.lens.split('.');
        for (var prop in props) {
          name += "[" + props[prop] + "]";
        }
        return name;
      };
      // Wrap the object for the PATCH update
      $scope.wrapObject = function(result) {
        var object = {}, innerObject = object;
        var props = $scope.lens.split('.');
        var i;
        for (i = 0; i <= props.length-2; i++) {
          innerObject[props[i]] = {};
          innerObject = innerObject[props[i]];
        }
        innerObject[props[i]] = result;
        return object;
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
        $scope.set($scope.object, $scope.lens, $scope.editableValue);
        $scope.$parent.updatePerson( $scope.object.id['$oid'],
          { person: $scope.wrapObject( $scope.editableValue ) },
          function() {
            console.log("successful update");
          }, function() {
            console.log("unsuccessful update");
            $scope.enableEditor();
          }
        );
        $scope.disableEditor();
      };
      $scope.cancel = function() {
        $scope.disableEditor();
      };
    }
  };
});
