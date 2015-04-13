Then(/^I should see login form$/) do
  expect(page).to have_selector('.login-form')
end

Then(/^I should successfully sign in$/) do
  webmock_1_invoice

  click_button('Log in')

  expect(page).to have_css('.invoice-list')
end

Then(/^I should not successfully sign in$/) do
  click_button('Log in')

  expect(page).to have_content('Log in')
end
