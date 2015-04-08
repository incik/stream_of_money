Then(/^I should see login form$/) do
  expect(page).to have_selector('form.new_user')
end

Then(/^I should successfully sign in$/) do
  click_button('Log in')

  expect(page).to have_css('div.invoice-list')
end

Then(/^I should not successfully sign in$/) do
  click_button('Log in')

  expect(page).to have_content('Log in')
end