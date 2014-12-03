Feature: Person Show Page
  Scenario: Adding a Suffix
    Given I am a logged in user
    When  I visit the grunt /#/people index
    And   I click on the first person's display box
    And   I click on the person name tab
    And   I click on the suffix editable
    And   I submit "Jr." to the Suffix input
    Then  the suffix editable should display "Jr."
    And   my suffix should equal "Jr."

  Scenario: Adding a condition
    Given I am a logged in user
    And   there is 1 person in the database with 1 conditions
    When  I visit the grunt /#/people index
    And   I click on the first person's display box
    And   I click on the person conditions tab
    And   I click the add person conditions button
    Then  there should be 2 person condition editable groups
    And   there is 1 person in the database with 2 conditions
