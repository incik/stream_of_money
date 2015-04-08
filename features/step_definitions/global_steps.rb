When(/^I go to homepage$/) do
  visit '/'
end

Given /^I am logged in$/ do
  delete destroy_user_session_path
  visit new_user_session_path
  fill_in 'email', :with => 'tomas@vaisar.cz'
  fill_in 'password', :with => 'heslo'
  click_button('save')
end

Given /^I am not logged in$/ do
  delete destroy_user_session_path
end