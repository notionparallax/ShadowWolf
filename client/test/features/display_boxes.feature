Feature: Display Box

  Scenario: Read name
    Given There is a display box for a person
    Then  The person's name should be visible

  Scenario: Mouse hover on box
    Given There is a display box for a person
    When  I hover my mouse over it
    Then  I should be able to see their extension

  Scenario: Mouse hover on box of non active person
    Given There is a display box for a person
    And   the person is not active
    When  I hover my mouse over it
    Then  I should be able to see their extension
    And   their current condition

  Scenario: Mouse hover on project's box
    Given there is a display box for a project
    When  I hover my mouse over it
    Then  I should be able to see it's project name
    And   I should be able to see it's project number

  Scenario: Clicking a display box
    Given There is a display box for a person
    When  I click on their display box
    Then  I should be redirected to their page
