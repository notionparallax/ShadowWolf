"use strict";

angular.module("ShadowWolf")
.directive("editable", function(Lens, Session) {
  var editDisabled = false;
  return {
    restrict: "E",
    replace: false,
    templateUrl: 'scripts/directives/editable.html',
    scope: {
      label: "@",
      object: "=",
      objectName: "@object",
      subobject: "=",
      lens:  "@",
      sublens: "@",
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
        if (editDisabled || Session.getPersonId() != $scope.object.id['$oid']) return;
        $scope.editorEnabled = true;
        $scope.editableValue = $scope.subobject && $scope.sublens
          ? $scope.subobject[$scope.sublens] : Lens.get($scope.object, $scope.lens);
      };

      $scope.disableEditor = function() {
        $scope.editorEnabled = false;
      };

      /**
       * Saves the edited value in the rails database. If the subobject and sublens
       * variables exist then it will send all of the sibling values back to the
       * server, otherwise it just sends back the single field.
       */
      $scope.save = function() {
        var updateObject;
        if ($scope.subobject) {
          $scope.subobject[$scope.sublens] = $scope.editableValue;
          updateObject = { person: $scope.wrapObject( $scope.get( $scope.object, $scope.lens ) ) };
        } else {
          $scope.set($scope.object, $scope.lens, $scope.editableValue);
          updateObject = { person: $scope.wrapObject( $scope.editableValue ) };
        }
        $scope.$parent.updatePerson( $scope.object.id['$oid'],
          updateObject,
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
