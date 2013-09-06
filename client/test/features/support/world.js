var Zombie = require('zombie');
var World = function(callback) {
  this.browser = new Zombie();

  callback();
};
exports.World = World;
