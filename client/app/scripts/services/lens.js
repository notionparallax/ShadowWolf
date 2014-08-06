'use strict';

angular.module("ShadowWolf")
.service("Lens", function() {
  function getFieldAndMaybeIndex(fieldString) {
    return {
      field: fieldString.split('[')[0],
      index: fieldString.split('[')[1] ? fieldString.split('[')[1].split(']')[0] : undefined
    };
  }
  /**
   * A getter function which will take a '.' separated list of attributes to traverse.
   * @param object Object to traverse the properties of.
   * @param lens   Dot separated list of properties, e.g. "a.b.c".
   * @returns      The selected property.
   */
  this.get = function(object, lens) {
    if (!lens) return object;
    lens = lens.split('.');
    var i = 0;
    try {
      while (i <= lens.length-1) {
        var fieldAndMaybeIndex = getFieldAndMaybeIndex(lens[i++]);
        object = object[fieldAndMaybeIndex.field];
        if (fieldAndMaybeIndex.index) {
          for (var j=0; j < object.length; j++) {
            if (fieldAndMaybeIndex.index == object[j].id['$oid']) {
              object = object[j];
              j=object.length;
            }
          }
        }
      }
    } catch (e) {
      object = undefined;
    }
    return object;
  };

  /**
   * A setter function which will take a '.' separated list of attributes to traverse.
   * @param object Object to traverse the properties of.
   * @param lens   Dot separated list of properties, e.g. "a.b.c".
   * @param value  Value that will be set.
   */
  this.set = function(object, lens, value) {
    lens = lens.split('.');
    var i = 0;
    try {
      while (i <= lens.length-2) {
        var fieldAndMaybeIndex = getFieldAndMaybeIndex(lens[i++]);
        object = object[fieldAndMaybeIndex.field];
        if (fieldAndMaybeIndex.index) {
          for (var j=0; j < object.length; j++) {
            if (fieldAndMaybeIndex.index == object[j].id['$oid']) {
              object = object[j];
              j=object.length;
            }
          }
        }
      }
      object[lens[i]] = value;
    } catch (e) {}
  };

  // Wrap the object for the PATCH update
  this.wrapObject = function(lens, result) {
    var object = {}, innerObject = object;
    var props = lens.split('.');
    var i, parentObject = object;
    for (i = 0; i <= props.length-1; i++) {
      var fieldAndMaybeIndex = getFieldAndMaybeIndex(props[i]);
      if (fieldAndMaybeIndex.index) {
        innerObject[fieldAndMaybeIndex.field] = [{}];
        parentObject = innerObject[fieldAndMaybeIndex.field];
        innerObject = innerObject[fieldAndMaybeIndex.field][0];
        innerObject['id'] = fieldAndMaybeIndex.index;
      } else {
        innerObject[props[i]] = {};
        parentObject = innerObject;
        innerObject = innerObject[props[i]];
      }
    }
    if (Array.isArray(parentObject)) {
      parentObject[0] = result;
    } else {
      parentObject[props[i-1]] = result;
    }
    return object;
  };
});
