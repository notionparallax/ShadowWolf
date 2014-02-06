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
      lens:        "@"
    },
    controller: function($scope) {
      $scope.updateParent = Person.update;
      $scope.objects = function() {
        return Lens.get($scope.object, $scope.lens);
      };

      $scope.addObject = function() {
        $scope.objects().push({});
      };
      $scope.removeObject = function(object) {
        var objects = $scope.objects();
        var index = objects.indexOf(object);
        objects.splice(index,1);
      };
    }
  };
});
