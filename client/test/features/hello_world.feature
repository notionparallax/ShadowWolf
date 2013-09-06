Feature: Greeting Feature
  As a user of ShadowWolf
  I want to be greeted by the wolf
  So that I can concentrate on building awesome buildings

  Scenario: Visiting the website
    Given I am an average user
    When I go to the main page
    Then I should see "Hello World" on the page.
