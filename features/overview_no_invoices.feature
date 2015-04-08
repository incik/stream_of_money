Feature: Overview with no invoices

  Scenario: I have no invoices
    Given I am logged in as "karel@email.cz"
    And I go to dashboard
    Then I see no invoices