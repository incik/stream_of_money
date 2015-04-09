Given(/^I have at least one invoice$/) do
  webmock_1_invoice

  visit '/'
  expect(page).to have_css('.invoice-row', count: 1)
end

When(/^I expand invoice$/) do
  first('.invoice-expander').click
end

Then(/^I should see invoice lines$/) do
  expect(page).to have_css('.invoice-detail-row')
end

Then(/^I should see edit link$/) do
  pending # express the regexp above with the code you wish you had
end
