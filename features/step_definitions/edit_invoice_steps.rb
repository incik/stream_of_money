When(/^I fill expense field with "(.*?)"$/) do |value|
  fill_in 'expense_expense', with: value
end
