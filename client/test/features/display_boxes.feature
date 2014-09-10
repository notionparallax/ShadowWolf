Feature: Display Box

  Scenario: Read name
    Given there is a people display box
    Then  the person's name should be visible

  Scenario: Mouse hover on box
    Given there is a people display box
    When  I hover my mouse over it
    Then  I should be able to see their extension

  Scenario: Mouse hover on box of non active person
    Given there is a people display box
    And   the person is not active
    When  I hover my mouse over it
    Then  I should be able to see their extension
    And   I should be able to see their current condition

  Scenario: Mouse hover on project's box
    Given there is a projects display box
    When  I hover my mouse over it
    Then  I should be able to see its project name
    And   I should be able to see its project number

  Scenario: Clicking a display box
    Given there is a people display box
    When  I click on their display box
    Then  I should be redirected to their page
