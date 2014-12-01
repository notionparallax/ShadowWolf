Feature: Project Sheets
  Scenario: Adding a Tag
    Given I am a logged in user
    And   there exists a project
    When  I visit the grunt project index
    And   visit the first project's show page
    And   click on legacy tab
    And   click on first testimonial tags editable
    And   enter 'New Tag'
    Then  the first project should have a tag 'New Tag' on it's first building legacy testimonial
    And   on the Project Sheets tab there exists a tab for 'New Tag'

  Scenario: Removing a Tag
    Given I am a logged in user
    And   there exists a project with a tag on its first testimonial
    When  I visit the grunt project index
    And   visit the first project's show page
    And   click on legacy tab
    And   click on the cross for the first testimonial tags editable tag
    Then  the first project should no longer have a tag on it's first building legacy testimonial
