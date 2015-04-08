Feature: Price list with no items

  Background:
    Given I am logged in as 'karel@seznam.cz'
    And I go to price list
    Then I see no price list items

  Scenario: Adding price list item
    When I go to add price list item
    And I see new price list item form
    And I fill "name" with "Konzultace"
    And I fill "price_per_unit" with "800"
    And I save price list item
    Then I should see one price list item

  Scenario: Adding price list item without price
    When I go to add price list item
    And I see new price list item form
    And I fill "name" with "Konzultace"
    And I save price list item
    Then I should see error

  Scenario: Adding price list item without name
    When I go to add price list item
    And I see new price list item form
    And I fill "price_per_unit" with "800"
    And I save price list item
    Then I should see error
