When(/^I go to (homepage|dashboard)$/) do |dest|
  visit '/'
end

Then /^show me the page$/ do
  save_and_open_page
end

Given /^I am logged in$/ do
  FactoryGirl.create :tomasvaisarcz

  delete destroy_user_session_path
  visit new_user_session_path
  fill_in 'user_email', :with => 'tomas@vaisar.cz'
  fill_in 'user_password', :with => 'heslo'
  click_button('Log in')
end

Given /^there is user "(.*?)"$/ do |email|
  FactoryGirl.create(:user, email: email)
end

Given /^I am not logged in$/ do
  delete destroy_user_session_path
end

When(/^I fill "(.*?)" with "(.*?)"$/) do |element, value|
  fill_in element, :with => value
end