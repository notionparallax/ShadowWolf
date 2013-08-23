Feature: Create a user
  In order to add a user to the system
  As an admin
  I want a page to create a user from

  Scenario: New User
    Given I have a person to create
    When I click 'New User'
    Then I should be directed to a New User page
    And all the fields should be empty
