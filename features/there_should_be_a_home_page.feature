Feature: Go to the home page
  In order to give a nice place for people to land regardless of their status
  As any user 
  I should be able to go to the home page

  @javascript
  Scenario: Seeing home
    Given I'm a non-logged-in user
    When I go to the home route
    Then I see 'hello'
