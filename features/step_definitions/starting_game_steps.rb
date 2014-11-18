def in_browser(name)
  old_session = Capybara.session_name
  Capybara.session_name = name
  yield
  Capybara.session_name = old_session
end

Given(/^I am on the homepage$/) do
  visit '/'
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content text
end

When(/^I don't fill in "(.*?)"$/) do |name|
 fill_in "name", :with => ""
 click_on "Play"
end

Then(/^I should "(.*?)"$/) do |text|
  expect(page).to have_content text
end

Given(/^there are no opponents$/) do
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |name, text|
  fill_in "name", :with => text
end


Then(/^I go to the welcome page$/) do
  visit '/welcome'
end

Then(/^I go to the play page$/) do
  visit '/play'
end

Given(/^an oponent exists$/) do
  in_browser(:two) do
  visit '/'
  fill_in "name", :with => "Anna"
 	click_on "Play"
 end
end

When(/^I click on "(.*?)"$/) do |button|
  in_browser(:one) do
  click_on button
  end
end