Feature: Project Sheets

  Scenario: Removing a Tag
    Given I am a logged in user
    And   there is 1 project in the database with 1 testimonial, with a tag
    When  I visit the grunt /#/projects index
    And   I click on the first project's display box
    And   I click on the projects legacy tab
    And   I click on the cross for the first testimonial tags editable tag
    Then  I should have 1 project in the database with no tags on its testimonial
  Scenario: Adding a Tag
    Given I am a logged in user
    And   there is 1 project in the database with 1 testimonial
    When  I visit the grunt /#/projects index
    And   I click on the first project's display box
    And   I click on the projects legacy tab
    And   I click on the tags editable
    And   I submit "New Tag" to the tags input for the tags property
    Then  I should have 1 project in the database with tag 'New Tag' on its testimonial
    And   on the Project Sheets tab there exists a tab for 'New Tag'
