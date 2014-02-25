'use strict';

angular.module("ShadowWolf")
.service('Models',function(Person,Project){
  this.update = function(objectName) {
    if (objectName == "person") {
      return Person.update;
    } else if (objectName == "project") {
      return Project.update;
    } else {
      console.log("Model.update called with invalid objectName: " + objectName);
      return function(){};
    }
  };
});
