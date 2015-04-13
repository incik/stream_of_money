When(/^I fill expense field with "(.*?)"$/) do |value|
  fill_in 'expense_expense', with: value, match: :first
end

When(/^I save the changes$/) do
  click_on('Create', match: :first)
end

Then(/^I should see expenses equal to "(.*?)"$/) do |arg1|
  expect(find_field('expense_expense', match: :first).value).to eq(arg1)
end
