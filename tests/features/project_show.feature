Feature: Project Show
  Issue #398: cannot add things to project pages


  Scenario: Add a new press attention
    Given I am a logged in user
    And   there is 1 project in the database with 1 press attentions
    When  I visit the grunt /#/projects index
    And   I click on the first project's display box
    And   I click on the project press tab
    And   I click the add press attentions button
    Then  there should be 2 press attention editable groups

  Scenario: Delete a testimonial while logged in
    Given I am a logged in user
    And   there is 1 project in the database with 2 testimonials
    When  I visit the grunt /#/projects index
    And   I click on the first project's display box
    And   I click on the project legacy tab
    And   I click the remove testimonial button
    Then  there should be 1 testimonial in the database
