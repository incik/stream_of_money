Then(/^I should see registration link$/) do
  expect(page).to have_selector('a', text: 'Sign up')
end

Then(/^I go to registration$/) do
  visit new_user_registration_path
end

Then(/^I should successfully register$/) do
  click_button('save')
  expect(page).to have_css('.invoice-list')
end

Then(/^I should not register and I should see error message$/) do
  click_button('save')
  expect(page).to have_css('#error_explanation')
end

Then(/^I should not register and I should see error message about exisiting account$/) do
  click_button('save')
  # TODO too much specific
  expect(page).to have_content('Email has already been taken')
end