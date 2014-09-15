Feature: Search Bar

  Scenario: Loading projects index
    Given I am on the projects index
    When  the page first loads
    Then  the search bar should have focus

  Scenario: Loading people index
    Given I am on the people index
    When  the page first loads
    Then  the search bar should have focus
