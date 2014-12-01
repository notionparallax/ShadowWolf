"use strict";

angular.module("ShadowWolf")
.service("Tags", function() {
  this.project = function(proj) {
    return {
      getTags: function($query) {
        var tags = proj.building.legacy.initiatives.map(
          function(initiative) { return initiative.tags; }
        ).reduce(function(acc,next) { console.log(next);return acc.concat(next); }, [])
        var tagsFound = {};
        tags = tags.filter(function(tag) {
          if (tagsFound[tag]) return false;
          else {
            tagsFound[tag] = true;
            return $query === undefined ? true : tag.indexOf($query) >= 0;
          }
        });
        console.log(tags);
        return tags;
      }
    };
  };
});
