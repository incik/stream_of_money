Feature: Homepage for user that's not logged in

  Background:
    Given I am not logged in
    And I go to homepage
    Then I should see login form

  Scenario: Successful signing in
    When I fill "username" with "tomas@vaisar.cz"
    And I fill "password" with "heslo"
    Then I should be successfully signed in

  Scenario: Unsuccessful signing in
    When I fill "username" with "vincent@seznam.cz"
    And I fill "password" with "mrnavy"
    Then I should see error message

