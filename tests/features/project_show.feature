Feature: Project Show
  Issue #398: cannot add things to project pages


  Scenario: Add a new press attention
    Given I am a logged in user
    And   there are 1 projects in the database
    When  I visit the grunt /#/projects index
    And   I click on the first project's display box
    And   I click on the project press tab
    And   I click the add attentions button
    Then  a new attentions editable group should appear
