describe('initial tests:',function(){


  
  /*
  describe('editable tests', function(){

    it("should show help text when a label is hovered", function() {
      //Where helptext container is called `x`
      magicalEditableSetupFunction(someJSON, someHelpText, more, args, that, we, will, need);
      $('label.editable-lable"').trigger('mouseover');
      expect($('#helptext-for-x')).toBeHidden();
      $('label.editable-lable"').trigger('mouseout');
      expect($('#helptext-for-x')).toBeShown();
    });

    it("should save the text entered if ENTER is pressed", function() {
      magicalEditableSetupFunction(someJSON, someHelpText, more, args, that, we, will, need);
      magicalEditable_gotoEditMode('selector.of.editable.we.want').then(function(edInput){
        edInput.clear();
        edInput.sendKeys("I'm typing, pretty cool eh!")
        ptor.actions().sendKeys(protractor.Key.ENTER).perform(); //http://stackoverflow.com/questions/19914915/how-to-make-protractor-press-the-enter-key
      }).then(function(){
        expect($('div.form-control-static.editable.editable-text')).toMatch("I'm typing, pretty cool eh!");
      });
    });
      
    it("should NOT save the text entered if ENTER is pressed", function() {
      magicalEditableSetupFunction(someJSON, someHelpText, more, args, that, we, will, need);
      magicalEditable_gotoEditMode('selector.of.editable.we.want').then(function(edInput){
        edInput.clear();
        edInput.sendKeys("I'm typing, pretty cool eh!")
        ptor.actions().sendKeys(protractor.Key.ESCAPE).perform(); //http://stackoverflow.com/questions/19914915/how-to-make-protractor-press-the-enter-key
      }).then(function(){
        expect($('div.form-control-static.editable.editable-text')).not.toMatch("I'm typing, pretty cool eh!");
      });
    });
      
    it("should NOT allow 'conditions' not on the list", function() {
      magicalEditableSetupFunction(someJSON, someHelpText, more, args, that, we, will, need);
      magicalEditable_gotoEditMode('selector.of.editable.we.want').then(function(edInput){
        edInput.clear();
        edInput.sendKeys("poopy fart face")
        ptor.actions().sendKeys(protractor.Key.ENTER).perform();
      }).then(function(){
        expect("the server to tell us that it's not happy"); //#92
      });
    });
      
    it("should allow 'conditions' on the list", function() {
      magicalEditableSetupFunction(someJSON, someHelpText, more, args, that, we, will, need);
      magicalEditable_gotoEditMode('selector.of.editable.we.want').then(function(edInput){
        edInput.clear();
        edInput.sendKeys("active")
        ptor.actions().sendKeys(protractor.Key.ENTER).perform();
      }).then(function(){
        expect("the server to tell us that it is happy"); //#92
      });
    });

  });
  */

});
