Feature: Flash notification

  Scenario: Login Success
    Given I have successfully logged in
    Then  the flash should report "Login successful"

  Scenario: Login Fail
    Given I have failed a login attempt
    Then  the flash should report "Login unsuccessful"

  Scenario: Editable Submit
    Given I have submitted something via an editable
    Then  the flash should report "Updating something"

  Scenario: Editable Submit Success
    Given I have successfully submitted something via an editable
    Then  the flash should report "Updated something"
    And   offer to undo the update

  Scenario: Editable Submit Failure
    Given I have unsuccessfully submitted something via an editable
    Then  the flash should report "Update unsuccessful"
    And   share any error messages
    And   enable the editable with the failed value

  Scenario: Guest trying to enable Editable
    Given I am a guest user
    And   there is an editable
    When  I try to enable it
    Then  the flash should report I lack permissions
    And   offer to log me in

  Scenario: Unauthorized user trying to enable Editable
    Given I am a user
    And   there is an editable
    When  I try to enable it
    Then  the flash should report I lack permissions
    But   it should not offer to log me in

  Scenario: Guest trying to view project page
    Given I am a guest user
    When  I try to view a project page
    Then  the flash should report I lack permissions
    And   offer to log me in

  Scenario: Open Asset Project Image Fails
    Given I am on a project page
    When  the project's image fails to load in the background
    Then  the flash should report the image failed to be found
