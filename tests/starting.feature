Feature: Index Page
  Scenario: Basic
    Given there are 10 people in the database
    When  I visit the people index
    Then  there should be 10 display boxes
