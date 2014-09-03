Feature: Editables

  Scenario: Display String Data
    Given I have an editable with string data
    Then  The editable should display that data

  Scenario: Display Textual Data
    Given I have an editable with textual data
    Then  The editable should display that data

  Scenario: Display Boolean Data
    Given I have an editable with boolean data
    Then  The editable should display that data

  Scenario: Display Numerical Data
    Given I have an editable with numerical data
    Then  The editable should display that data

  Scenario: Display Date Data
    Given I have an editable with date data
    Then  The editable should display that data

  Scenario: Display Year Data
    Given I have an editable with year data
    Then  The editable should display that data

  Scenario: Click to edit
    Given I have an editable with string data
    When  I click on it
    Then  I should be able to type to edit

  @dev
  Scenario: Logging Errors
    Given I have an editable without valid data
    When  I click on it
    Then  it should send a GA error

  Scenario: Hotkey to save
    Given I have made my changes to an editable
    When  I press enter with focus
    Then  it should submit the data

  Scenario: Hotkey to cancel
    Given I have made my changes to an editable
    When  I press escape with focus
    Then  it should cancel my changes and disable the editable
