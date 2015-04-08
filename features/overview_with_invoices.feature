Feature: Overview with some invoices

  Background:
    Given I'm logged in
    And I go to dashboard
    And I have at least one invoice

  @javascript
  Scenario: Expanding invoice
    When I expand invoice
    Then I should see invoice lines
    And I should see edit link

  @javascript
  Scenario: Editing invoice
    When I expand invoice
    And I go to edit invoice page
    Then I should see invoice edit form