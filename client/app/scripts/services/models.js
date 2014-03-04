'use strict';

angular.module("ShadowWolf")
.service('Models',function(Person,Project){
  this.update = function(objectName) {
    var updateMethod;
    if (objectName == "person") {
      updateMethod = Person._getPerson().update;
    } else if (objectName == "project") {
      updateMethod = Project._getProject().update;
    } else {
      console.log("Model.update called with invalid objectName: " + objectName);
      return function(){};
    }
    return function(id, postData, success, error) {
      var idObject = {};
      idObject[objectName + 'Id'] = id;
      return updateMethod(idObject, postData, success, error);
    };
  };
});
