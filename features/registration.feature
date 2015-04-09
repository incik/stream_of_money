Feature: User registration

  Background:
    Given I am not logged in
    And I go to homepage
    Then I should see registration link
    And I go to registration

  Scenario: User fills all required fields
    When I fill "user_name" with "Tomáš"
    And I fill "user_surname" with "Vaisar"
    And I fill "user_password" with "heslo123"
    And I fill "user_password_confirmation" with "heslo123"
    And I fill "user_email" with "tomas@vaisar.cz"
    And I fill "user_billapp_user" with "tomas@vaisar.cz"
    And I fill "user_billapp_password" with "heslo"
    And I fill "user_billapp_agenda" with "tomvaisar"
    Then I should successfully register

  Scenario: User doesn't fill all required fields
    When I fill "user_name" with "Tomáš"
    And I fill "user_surname" with "Vaisar"
    And I fill "user_password" with "heslo123"
    And I fill "user_password_confirmation" with "heslo123"
    And I fill "user_billapp_user" with "tomas@vaisar.cz"
    And I fill "user_billapp_password" with "heslicko"
    Then I should not register and I should see error message

  Scenario: User is already registered
    Given there is user "tomas@vaisar.cz"
    When I fill "user_name" with "Tomáš"
    And I fill "user_surname" with "Vaisar"
    And I fill "user_password" with "heslo123"
    And I fill "user_password_confirmation" with "heslo123"
    And I fill "user_email" with "tomas@vaisar.cz"
    And I fill "user_billapp_user" with "tomas.vaisar@gmail.com"
    And I fill "user_billapp_password" with "heslicko"
    And I fill "user_billapp_agenda" with "tomvaisar"
    Then I should not register and I should see error message about exisiting account
