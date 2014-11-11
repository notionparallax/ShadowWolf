Feature: Is up
  Scenario: Basic people server
    Given there are 10 people in the database
    When  I visit the rails people index
    Then  there should be 10 json people

  Scenario: Basic people client
    Given there are 10 people in the database
    When  I visit the grunt people index
    Then  there should be 10 display boxes

  Scenario: Basic projects server
    Given there are 10 projects in the database
    When  I visit the rails projects index
    Then  there should be 10 json projects

  Scenario: Basic projects client
    Given there are 10 projects in the database
    When  I visit the grunt projects index
    Then  there should be 10 json projects
