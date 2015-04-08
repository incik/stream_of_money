When(/^I go to homepage$/) do
  visit '/'
end

Given /^I am logged in$/ do
  FactoryGirl.create :tomasvaisarcz

  delete destroy_user_session_path
  visit new_user_session_path
  fill_in 'user_email', :with => 'tomas@vaisar.cz'
  fill_in 'user_password', :with => 'heslo'
  click_button('save')
end

Given /^I am not logged in$/ do
  delete destroy_user_session_path
end

When(/^I fill "(.*?)" with "(.*?)"$/) do |element, value|
  fill_in(element, value)
end