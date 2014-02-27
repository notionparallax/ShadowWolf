'use strict';

angular.module("ShadowWolf")
.directive("editableGroup", function(Lens, Models, Flash) {
  return {
    restrict:        "E",
    replace:         false,
    transclude:      true,
    templateUrl:     "scripts/directives/editable_group.html",
    scope: {
      object  :      "=",
      objectName:    "@object",
      subgroupClass: "@",
      lens:          "@"
    },
    controller: function($scope) {
      $scope.target = function() {
        return Lens.get($scope.object, $scope.lens);
      };

      $scope.isPlural = function() {
        return $scope.lens[$scope.lens.length-1] == ']';
      };

      // NB: this function only makes sense if isPlural() == true
      $scope.addObject = function() {
        var newObject = { id: null };
        $scope.target().push(newObject);

        // TODO refactor this along with `removeObject`
        var updateObject = {};
        updateObject[$scope.objectName] = Lens.wrapObject($scope.lens, $scope.target());

        Models.update($scope.objectName)( $scope.object.id['$oid'],
          updateObject,
          function(result){
          $scope.object = result;
          console.log("successfully created");
        }, function(){
          console.log("unsuccessfully created");
          Flash.add({
            template: "<p>Unable to create a new object at this time. Please check your connection and try again.</p>",
            css: "flash-fail"
          }, 5000);
          $scope.target().splice($scope.target().indexOf(newObject), 1);
        });
      };
      // NB: this function only makes sense if isPlural() == true
      $scope.removeObject = function(object) {
        debugger;
        if (!confirm("Are you sure you wish to delete this item?")) return;

        // Remove locally
        var objects = $scope.target();
        var index = objects.indexOf(object);
        objects.splice(index,1);

        // Remove elsewhere
        var updateObject = {};
        updateObject[$scope.objectName] = Lens.wrapObject($scope.lens, [object.id['$oid']]);

        Models.update($scope.objectName)( $scope.object.id['$oid'],
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
