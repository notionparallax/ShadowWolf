Feature: Project Index


  Scenario: Get image on index page
    Given I am a logged in user
    And   there is 1 project in the database with project number S1106001
    And   I have already visited project show page for S1106001
    When  I visit the grunt /#/projects index
    Then  the background image for project number S1106001's display box should not be a kitten

