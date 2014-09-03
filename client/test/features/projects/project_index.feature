Feature: Project Index

  Scenario: Visiting a project page
    Given I am a logged in average user
    When  I go to the project index
    And   I click on a project
    Then  I should be redirected to the project's summary page

  Scenario: Searching for a project
    Given I am on the project index
    When  I type into the search bar
    Then  the displayed projects should change accordingly
