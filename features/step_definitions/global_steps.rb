When(/^I go to (homepage|dashboard)$/) do |dest|
  visit '/'
end

Then /^show me the page$/ do
  save_and_open_page
end

Then /^log in user "(.*?)"$/ do |username|
  delete destroy_user_session_path
  visit new_user_session_path
  fill_in 'user_email', :with => username
  fill_in 'user_password', :with => 'heslo123'
  click_button('Log in')
end

Given /^I am logged in$/ do
  FactoryGirl.create :tomasvaisarcz
  webmock_1_invoice

  step 'log in user "tomas@vaisar.cz"'
end

Given(/^I am logged in as 'karel@seznam\.cz'$/) do
  pending # express the regexp above with the code you wish you had
end

Given /^I am logged in as karel@bagr.cz$/ do
  FactoryGirl.create :karelbagrcz
  webmock_no_invoices

  step 'log in user "karel@bagr.cz"'
end

Given /^there is user "(.*?)"$/ do |email|
  FactoryGirl.create(:user, email: email, billapp_user: email)
end

Given /^there is billapp user "(.*?)" with agenda "(.*?)" and password "(.*?)"$/ do |email, agenda, password|
  FactoryGirl.create(:billapp_user, email: email,
                            billapp_user: email,
                            billapp_agenda: agenda,
                            billapp_password: password)
end

Given /^I am not logged in$/ do
  delete destroy_user_session_path
end

When(/^I fill "(.*?)" with "(.*?)"$/) do |element, value|
  fill_in element, :with => value
end
