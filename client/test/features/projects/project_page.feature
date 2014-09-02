Feature: Project Page
  In order for us to understand the history of a person   
  As any logged in user
  I should be able to go to a person's page and see the projects in their history

  Scenario: Seeing people's projects
    Given I am a logged in average user
    When  I go to a project page
    Then  I should be able to see the people who worked on this project

  Scenario: Searching for a project
    Given I am on the project index
    When  I type into the search bar
    Then  the displayed projects should change accordingly
