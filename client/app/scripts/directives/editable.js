"use strict";

angular.module("ShadowWolf")
.directive('ngEnter', function () {
    return function (scope, element, attrs) {
        element.bind("keydown keypress", function (event) {
            if(event.which === 13) {
                scope.$apply(function (){
                    scope.$eval(attrs.ngEnter);
                    console.log('rtn pressed');
                });

                event.preventDefault();
            }
        });
    };
});

angular.module("ShadowWolf")
.directive('ngEscape', function () {
    return function (scope, element, attrs) {
        element.bind("keydown keypress", function (event) {
            if(event.keyCode === 27) {
                scope.$apply(function (){
                    scope.$eval(attrs.ngEnter);
                    console.log('esc pressed');
                });

                event.preventDefault();
            }
        });
    };
});

angular.module("ShadowWolf")
.directive("editable", function(Lens, Session, Models, Flash) {
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
      $scope.editorEnabled= false;

      $scope.get = Lens.get;
      $scope.set = Lens.set;

      // Get the name for the label and input tag
      $scope.getName = function() {
        // TODO properly get the name
        return '';
        var name = $scope.objectName;
        var props = $scope.lens.split('.');
        for (var prop in props) {
          name += "[" + props[prop] + "]";
        }
        return name;
      };

      $scope.enableEditor = function() {
        //if (editDisabled || Session.getPersonId() != $scope.object.id['$oid']) return;
        $scope.editorEnabled = true;
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
        console.log('save called');
        // Set the value locally
        var object = $scope.subobject ? $scope.subobject : $scope.target();
        object[$scope.property] = $scope.editableValue;

        // Wrap it for transport
        var diffObject = { id: object.id['$oid'] };
        diffObject[$scope.property] = object[$scope.property];
        var updateObject;
        updateObject = {}; 
        updateObject[$scope.objectName] = Lens.wrapObject( 
            $scope.lens,
            diffObject
        );

        // Set it back on the server
        var flash = {
          template: '<p>Updating {{flash.label()}}...</p>',
          label: function() { return $scope.label; }
        };
        var handle = Flash.add(flash);
        Models.update($scope.objectName)( $scope.object.id['$oid'],
          updateObject,
          function() {
            flash.template = '<p>Updated {{flash.label()}}.</p>';
            flash.css = 'flash-success';
            handle.timeout(5000);
            Models.set($scope.objectName)($scope.object);
          }, function() {
            flash.template = '<p>Update unsuccessful for {{flash.label()}}. You may wish to check your submission.</p>';
            flash.css = 'flash-failure';
            handle.timeout(5000);
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
