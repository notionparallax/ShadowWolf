"use strict";

angular.module("ShadowWolf")
.directive("editable", function(Lens, Session) {
  var editDisabled = false;
  return {
    restrict: "E",
    replace: false,
    transclude: true,
    templateUrl: 'scripts/directives/editable.html',
    scope: true,
    link: function (scope, element, attrs) { 
      if (attrs['editDisabled']) editDisabled = true;
      scope.property = attrs.property;
      scope.label = attrs.label;
      scope.type = attrs.type || 'text';
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

      $scope.enableEditor = function() {
        if (editDisabled || Session.getPersonId() != $scope.object.id['$oid']) return;
        $scope.editorEnabled = true;
        // TODO use ng-model?
        $scope.editableValue = $scope.subobject[$scope.property];
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

        // Set the value locally
        $scope.subobject[$scope.property] = $scope.editableValue;

        // Wrap it for transport
        var parentObject = Lens.get($scope.object, $scope.lens);
        updateObject = { person: Lens.wrapObject( $scope.lens,  parentObject ) };

        // Set it back on the server
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
