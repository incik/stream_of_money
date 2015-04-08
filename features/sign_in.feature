Feature: Homepage for user that's not logged in

  Background:
    Given I am not logged in
    And I go to homepage
    Then I should see login form

  Scenario: Successful signing in
    Given there is user "tomas@vaisar.cz"
    When I fill "user_email" with "tomas@vaisar.cz"
    And I fill "user_password" with "heslo123"
    Then I should successfully sign in

  Scenario: Unsuccessful signing in
    When I fill "user_email" with "vincent@seznam.cz"
    And I fill "user_password" with "mrnavy"
    Then I should not successfully sign in

