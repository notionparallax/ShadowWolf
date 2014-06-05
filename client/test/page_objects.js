function LoginButton() {
  var _button = element(by.css('.login-btn a'));
  this.click = _button.click;
  this.getText = _button.getInnerHtml;
}
function DisplayBoxes() {
  var _tiles = element.all(by.css('.info-box'));
  this.count = _tiles.count;
  this.get = _tiles.get;
}
function DisplayBox(box) {
  this.moreButton = box.findElement(by.css('.more-button'));
}
function Editable(element){
  this.getValue = function(){
    var output = element.findElement(by.css('.editable-text-display'));
    return output.getInnerHtml();
  };
  this.getHtml = function(){
    return element.getOuterHtml();
  };
  this.click = function(){
    element.findElement(by.css('.editable-output'))
           .click();
  };
  this.isInputMode = function(){
    return element.findElement(by.css('.editable-input'))
      .then(function()   {return true; },
            function(err){return false;});
  };
  this.isOutputMode = function(){
    return element.findElement(by.css('.editable-output'))
      .then(function()   {return true; },
            function(err){return false;});
  };
  this.sendKeys = function(){
    // TODO throw an error if not in InputMode
    // TODO make it work for textareas as well
    var inputElement = element.findElement(by.css('input'));
    return inputElement.sendKeys.apply(this, arguments);
  };
  this.submit = function() {
    element.findElement(by.css('.save-btn')).click();
  }
  this.getInputElement = function() {
    return element.findElement(by.css('input'));
  };
}
function EditableGroup(lens){
  var _element = element(by.css('editable-group[lens="' + lens + '"]'));
  var _elements = _element.findElements(by.css('editable'));

  this.getEditable = function(prop) {
    var editable = _element.findElement(by.css('editable[property="' + prop + '"]'));
    return new Editable(editable);
  };
  this.getHtml = function() {
    return _element.getOuterHtml();
  };
}

module.exports = {
  LoginButton: LoginButton,
  DisplayBoxes: DisplayBoxes,
  DisplayBox: DisplayBox,
  Editable: Editable,
  EditableGroup: EditableGroup
}
