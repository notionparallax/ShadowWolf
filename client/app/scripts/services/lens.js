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
    lens = lens.split('.');
    var i = 0;
    try {
      while (i <= lens.length-1) {
        var fieldAndMaybeIndex = getFieldAndMaybeIndex(lens[i++]);
        object = object[fieldAndMaybeIndex.field];
        if (fieldAndMaybeIndex.index) {
         object = object[fieldAndMaybeIndex.index];
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
         object = object[fieldAndMaybeIndex.index];
        }
      }
      object[lens[i]] = value;
    } catch (e) {}
  };

  // Wrap the object for the PATCH update
  this.wrapObject = function(lens, result) {
    var object = {}, innerObject = object;
    var props = lens.split('.');
    var i;
    for (i = 0; i <= props.length-2; i++) {
      innerObject[props[i]] = {};
      innerObject = innerObject[props[i]];
    }
    innerObject[props[i]] = result;
    return object;
  };
});
