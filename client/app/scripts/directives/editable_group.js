'use strict';

angular.module("ShadowWolf")
.directive("editableGroup", function(Lens, Models, Flash, Session) {
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

      $scope.isLast = function() { return $scope.$parent.$last; };

      $scope.isPlural = function() {
        return $scope.lens ? $scope.lens[$scope.lens.length-1] == ']' : false;
      };

      // NB: this function only makes sense if isPlural() == true
      $scope.addObject = function() {
        if ($scope.objectName == 'person'
            && Session.getPersonId() != $scope.object.id.$oid) {
          var name = $scope.object.name.preferred_first || $scope.name.first;
          Flash.add({
            template: '<p>You need to be logged in as ' + name + ' to create more.</p>'
          }, 5000);
          return;
        }
        var newObject = { id: null };
        var parentLens = $scope.lens.slice(0,$scope.lens.lastIndexOf('['));
        var objects = Lens.get($scope.object,parentLens);
        objects.push(newObject);

        // TODO refactor this along with `removeObject`
        var updateObject = {};
        updateObject[$scope.objectName] = Lens.wrapObject($scope.lens, newObject);

        Models.update($scope.objectName)( $scope.object.id['$oid'],
          updateObject,
          function(result){
          Models.set($scope.objectName)(result);
          
        }, function() {
          
          Flash.add({
            template: "<p>Unable to create a new object at this time. Please check your connection and try again.</p>",
            css: "flash-fail"
          }, 5000);
          objects.splice(objects.indexOf(newObject), 1);
        });
      };
      // NB: this function only makes sense if isPlural() == true
      $scope.removeObject = function(object) {

        if (Session.getPersonId() && $scope.objectName == 'person' && Session.getPersonId() != $scope.object.id.$oid) {
          var name = $scope.object.name.preferred_first || $scope.name.first;
          Flash.add({
            template: '<p>You need to be logged in as ' + name + ' to remove this.</p>'
          }, 5000);
          return;
        }
        if ($scope.$parent.$last && $scope.$parent.$first) {
          // abort
          Flash.add({
            css: 'flash-fail',
            template: '<p>You must have at least one condition.</p>'
          }, 5000);
          return;
        }
        if (!confirm("Are you sure you wish to delete this item?")) return;

        // Remove locally
        // assumes $scope.lens ends with an id inside of a []
        var parentLens = $scope.lens.slice(0,$scope.lens.lastIndexOf('['));
        var objects = Lens.get($scope.object,parentLens);
        var index = objects.indexOf(object);
        objects.splice(index,1);

        // Remove elsewhere
        var updateObject = {};
        updateObject[$scope.objectName] = Lens.wrapObject(parentLens, [object.id['$oid']]);

        Models.update($scope.objectName)( $scope.object.id['$oid'],
          updateObject,
          function(){
          
        }, function(){
          
          objects.push(object);
        });
      };
    }
  };
});
