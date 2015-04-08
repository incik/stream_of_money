Feature: User registration

  Background:
    Given I am not logged in
    And I go to homepage
    Then I should see registration link
    And I go to registration

  Scenario: User fills all required fields
    When I fill "name" with "Tomáš"
    And I fill "surname" with "Vaisar"
    And I fill "password" with "heslo"
    And I fill "password_again" with "heslo"
    And I fill "email" with "tomas.vaisar@gmail.com"
    And I fill "billapp_user" with "tomas.vaisar@gmail.com"
    And I fill "billapp_password" with "heslicko"
    And I fill "billapp_agenda" with "tomvaisar"
    And I click on "register"
    Then I should be successfully registered

  Scenario: User doesn't fill all required fields
    When I fill "name" with "Tomáš"
    And I fill "surname" with "Vaisar"
    And I fill "password" with "heslo"
    And I fill "password_again" with "heslo"
    And I fill "billapp_user" with "tomas@vaisar.cz"
    And I fill "billapp_password" with "heslicko"
    And I click on "register"
    Then I should see error message

  Scenario: User is already registered
    When I fill "name" with "Tomáš"
    And I fill "surname" with "Vaisar"
    And I fill "password" with "heslo"
    And I fill "password_again" with "heslo"
    And I fill "email" with "tomas@vaisar.cz"
    And I fill "billapp_user" with "tomas.vaisar@gmail.com"
    And I fill "billapp_password" with "heslicko"
    And I fill "billapp_agenda" with "tomvaisar"
    And I click on "register"
    Then I should see error message about exisiting account