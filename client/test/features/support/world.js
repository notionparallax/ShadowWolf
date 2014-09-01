var browser = require('protractor').getInstance();
var World = function(callback) {
  this.browser = browser;
  this.x = require('protractor');
  callback();
};
exports.World = World;
