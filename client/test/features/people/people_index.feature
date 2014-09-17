Feature: People Index

  Scenario: Visiting a people page
    Given I am on the people index
    When  I click on a person
    Then  I should be redirected to the person's summary page

  Scenario: Searching for a person
    Given I am on the people index
    And   the database contains certain people
    When  I type into the search bar
    Then  the displayed people should change accordingly

  Scenario: Seeing things quickly
    Given I am an average user
    When  I am on the people index
    Then  I should see people photos within 2 seconds
