"use strict";

angular.module("ShadowWolf")
.service("Tags", function() {
  this.project = function(proj) {
    return {
      /**
       * This function is currently used to list tags for the
       * project sheet or to list tags while entering a new one and
       * autocompleting on $query.
       * @param $query Undefined if selecting all tags or a string if autocompleting to find a tag.
       */
      getTags: function($query) {
        /* Get all tags */
        var recursiveGetTags = function(object) {
          var tags = [];
          for (var i in object) {
            if (i === 'tags') {
              tags = tags.concat(object.tags);
            } else if (typeof object[i] === 'object') {
              tags = tags.concat(recursiveGetTags(object[i]));
            }
          }
          return tags;
        };
        var tags = recursiveGetTags(proj);
        /* Make tags unique */
        var tagsFound = {};
        tags = tags.filter(function(tag) {
          if (tagsFound[tag.toLowerCase()]) return false;
          else {
            tagsFound[tag.toLowerCase()] = true;
            return $query === undefined ? true : tag.toLowerCase().indexOf($query.toLowerCase()) >= 0;
          }
        });
        return tags;
      }
    };
  };
});
