Feature: Project Index

  Scenario: Visiting a project page
    Given I am a logged in average user
    When  I go to the project index
    And   I click on a project
    Then  I should be redirected to the project's summary page
