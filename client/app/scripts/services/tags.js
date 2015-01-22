"use strict";

angular.module("ShadowWolf")
.service("Tags", function() {
  this.project = function(proj) {
    return {
      getTags: function($query) {
        /* Get all tags */
        var getTags = function(object) { return object.tags; };
        var concat = function(acc,next) { return acc.concat(next); };
        var tags = proj && proj.building && proj.building.legacy ? [
            proj.building.dims.map(getTags),
            proj.building.brief_elements.map(getTags),
            proj.building.legacy.initiatives.map(getTags),
            proj.building.legacy.testimonials.map(getTags),
            proj.building.legacy.quotes.map(getTags),
            proj.building.legacy.awards.map(getTags),
            proj.building.legacy.templates.map(getTags),
            proj.building.legacy.esd.certifications.map(getTags),
            proj.building.legacy.esd.initiatives.map(getTags)
          ] : [];
        tags = tags.reduce(concat, []).reduce(concat, []);
        /* Make tags unique */
        var tagsFound = {};
        tags = tags.filter(function(tag) {
          if (tagsFound[tag]) return false;
          else {
            tagsFound[tag] = true;
            return $query === undefined ? true : tag.indexOf($query) >= 0;
          }
        });
        return tags;
      }
    };
  };
});
