'use strict';

angular.module("ShadowWolf")
.directive("editableGroup", function(Lens, Person) {
  return {
    restrict:     'E',
    replace:      false,
    transclude:   true,
    templateUrl:  'scripts/directives/editable_group.html',
    scope: {
      object:      "=",
      objectName:  "@object",
      subgroupClass: "@",
      lens:        "@"
    },
    controller: function($scope) {
      $scope.target = function() {
        return Lens.get($scope.object, $scope.lens);
      };

      $scope.isPlural = function() {
        return Array.isArray($scope.target());
      };

      // NB: this function only makes sense if isPlural() == true
      $scope.addObject = function() {
        $scope.target().push({});
      };
      // NB: this function only makes sense if isPlural() == true
      $scope.removeObject = function(object) {
        if (!confirm("Are you sure you wish to delete this item?")) return;

        // Remove locally
        var objects = $scope.target();
        var index = objects.indexOf(object);
        objects.splice(index,1);

        // Remove elsewhere
        var updateObject =
        { person: Lens.wrapObject($scope.lens, objects) };

        Person.update( $scope.object.id['$oid'],
          updateObject,
          function(){
          console.log("successfully destroyed");
        }, function(){
          console.log("unsuccessfully destroyed");
          Lens.get($scope.object, $scope.lens).push(object);
        });
      };
    }
  };
});
