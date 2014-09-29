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

  Scenario: Setting localStorage
    Given I am an average user
    And   I am on the people index
    Then  the localstorage should be set with people in it

  Scenario: Seeing things quickly
    Given I have already visited the people index
    When  I refresh the page
    Then  I should see people photos within 2 seconds
