Feature: Homepage for user that is logged in

  Scenario: I should go directly to dashboard
    Given I am logged in
    And I go to homepage
    Then I have at least one invoice


