'use strict';

angular.module('ShadowWolf')
.service('GA',function() {
  this.sendEvent = function(category,action,label,value) {
    ga('send','event',category,action,label,value);
  };
  this.charCodeToLabel = function(charCode) {
    var label;
    switch (charCode) {
      case 8:   label = "backspace"; break;
      case 9:   label = "tab"; break;
      case 13:  label = "enter"; break;
      case 16:  label = "shift"; break;
      case 17:  label = "ctrl"; break;
      case 18:  label = "alt"; break;
      case 19:  label = "pause break"; break;
      case 20:  label = "caps lock"; break;
      case 27:  label = "escape"; break;
      case 32:  label = "space"; break;
      case 33:  label = "page up"; break;
      case 34:  label = "page down"; break;
      case 35:  label = "end"; break;
      case 36:  label = "home"; break;
      case 37:  label = "left arrow"; break;
      case 38:  label = "up arrow"; break;
      case 39:  label = "right arrow"; break;
      case 40:  label = "down arrow"; break;
      case 45:  label = "insert"; break;
      case 46:  label = "delete"; break;
      case 91:  label = "left window key"; break;
      case 92:  label = "right window key"; break;
      case 93:  label = "select key"; break;
      case 96:  label = "numpad 0"; break;
      case 97:  label = "numpad 1"; break;
      case 98:  label = "numpad 2"; break;
      case 99:  label = "numpad 3"; break;
      case 100: label = "numpad 4"; break;
      case 101: label = "numpad 5"; break;
      case 102: label = "numpad 6"; break;
      case 103: label = "numpad 7"; break;
      case 104: label = "numpad 8"; break;
      case 105: label = "numpad 9"; break;
      case 106: label = "multiply"; break;
      case 107: label = "add"; break;
      case 109: label = "subtract"; break;
      case 110: label = "decimal point"; break;
      case 111: label = "divide"; break;
      case 112: label = "f1"; break;
      case 113: label = "f2"; break;
      case 114: label = "f3"; break;
      case 115: label = "f4"; break;
      case 116: label = "f5"; break;
      case 117: label = "f6"; break;
      case 118: label = "f7"; break;
      case 119: label = "f8"; break;
      case 120: label = "f9"; break;
      case 121: label = "f10"; break;
      case 122: label = "f11"; break;
      case 123: label = "f12"; break;
      case 144: label = "num lock"; break;
      case 145: label = "scroll lock"; break;
      case 186: label = "semi-colon"; break;
      case 187: label = "equal sign"; break;
      case 188: label = "comma"; break;
      case 189: label = "dash"; break;
      case 190: label = "period"; break;
      case 191: label = "forward slash"; break;
      case 192: label = "grave accent"; break;
      case 219: label = "open bracket"; break;
      case 220: label = "back slash"; break;
      case 221: label = "close braket"; break;
      case 222: label = "single quote"; break;
      default: label = String.fromCharCode(charCode);
    }
    return label;
  };
});
