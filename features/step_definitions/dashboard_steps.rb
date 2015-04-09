Given(/^I have at least one invoice$/) do
  webmock_1_invoice

  visit '/'
  expect(page).to have_css('.invoice-row', count: 1)
end