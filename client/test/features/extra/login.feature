Feature: Logins
  Scenario: Logging in
    Given I am a guest
    When  I click the login button
    And   fill and submit the login form
    Then  I want to find myself logged in
    And   I want to be on the same page I was on before I clicked log in

  Scenario: Loggin out
    Given I am a logged in average user
    When  I click the log out button
    Then  I want to be logged out

  Scenario: Loggin out on a restricted page
    Given I am a logged in average user
    And   I am on a page for which a guest lacks access
    When  I click the log out button
    Then  I want to be logged out
    And   be redirected to the people index
