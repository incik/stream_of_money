Given(/^I have at least one invoice$/) do
  webmock_1_invoice

  visit '/'
  expect(page).to have_css('.invoice-row', count: 1)
end

When(/^I expand invoice$/) do
  first('.invoice-expander').click
end

Then(/^I see no invoices$/) do
  expect(page).to have_css('.invoice-row', count: 0)
end

Then(/^I should see invoice lines$/) do
  expect(page).to have_css('.invoice-detail-row')
end

Then(/^I should see edit link$/) do
  expect(page).to have_css('.edit-link')
end

When(/^I go to edit invoice page$/) do
  webmock_invoice_hay

  first('.edit-link').click
end

Then(/^I should see invoice edit form$/) do
  expect(page).to have_css('.expenses-form')
end
