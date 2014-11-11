Feature: Search Bar

  Scenario: Loading people index
    Given the following people:
      | first_name | last_name | studio   | login  |
      |    Alex    |   King    | Sydney   | aking  |
      |    Sam     |   Smith   | Sydney   | ssmith |
      |    Jack    |   White   | Brisbane | jwhite |
    When  I visit the grunt /#/people index
    Then  the search bar should have focus
    And   there should be 3 display boxes

  Scenario: Typing first name into the search bar
    Given the following people:
      | first_name | last_name | studio   | login  |
      |    Alex    |   King    | Sydney   | aking  |
      |    Sam     |   Smith   | Sydney   | ssmith |
      |    Jack    |   White   | Brisbane | jwhite |
    When  I visit the grunt /#/people index
    And   I type 'Alex' into the searchBar
    Then  there should be 1 display box

  Scenario: Typing last name into the search bar
    Given the following people:
      | first_name | last_name | studio   | login  |
      |    Alex    |   King    | Sydney   | aking  |
      |    Sam     |   Smith   | Sydney   | ssmith |
      |    Jack    |   White   | Brisbane | jwhite |
    When  I visit the grunt /#/people index
    And   I type 'White' into the searchBar
    Then  there should be 1 display box

  Scenario: Typing studio into the search bar
    Given the following people:
      | first_name | last_name | studio   | login  |
      |    Alex    |   King    | Sydney   | aking  |
      |    Sam     |   Smith   | Sydney   | ssmith |
      |    Jack    |   White   | Brisbane | jwhite |
    When  I visit the grunt /#/people index
    And   I type 'Sydney' into the searchBar
    Then  there should be 2 display boxes


  Scenario: Loading projects index
    Given the following projects:
      | project_number | project_name |
      |    s100        |   school     |
      |    b100        |   bunker     |
      |    m999        |   beach      |
    When  I visit the grunt /#/projects index
    Then  the search bar should have focus
    And   there should be 3 display boxes

  Scenario: Typing project number into the search bar
    Given the following projects:
      | project_number | project_name |
      |    s100        |   school     |
      |    b100        |   bunker     |
      |    m999        |   beach      |
    When  I visit the grunt /#/projects index
    And   I type 's100' into the searchBar
    Then  there should be 1 display boxes

  Scenario: Loading projects index
    Given the following projects:
      | project_number | project_name |
      |    s100        |   school     |
      |    b100        |   bunker     |
      |    m999        |   beach      |
    When  I visit the grunt /#/projects index
    And   I type 'bunker' into the searchBar
    Then  there should be 1 display boxes
