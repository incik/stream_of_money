Feature: Editing invoice expenses

  Background:
    Given I'm logged in
    And I go to dashboard
    And I have at least one invoice
    And I expand invoice
    And I go to edit invoice page
    Then I should see invoice edit form

  @javascript
  Scenario: Adding the expense manually
    When I fill "expense_price" with "920"
    Then I should see expenses equal to "920"

  @javascript
  Scenario: Adding the expense from price list
    When I select "Konzultace" for price list item
    Then I should see "quantity" equal to "1"
    And I should see expenses equal to "800"
    When I fill "quantity" with "3"
    Then I should see expenses equal to "2400"

