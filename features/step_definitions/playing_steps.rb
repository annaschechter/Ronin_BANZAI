def in_browser(name)
  old_session = Capybara.session_name
  Capybara.session_name = name
  yield
  Capybara.session_name = old_session
end

def swap_sessions
  Capybara.current_driver = Capybara.current_driver == :selenium.for :safari ? :rack_test : :selenium
end

Given(/^I am on the waiting page$/) do
  visit '/'
  fill_in "name", :with => "Anna"
  click_on "Play"
end

When(/^the second player joins the game$/) do
  swap_sessions
  visit'/'
  fill_in "name", :with => "Anna"
  click_on "Play"
end

Then(/^I see "(.*?)"$/) do |text|
  expect(page).to have_content text
end

Then(/^I go to the play page$/) do
  visit '/play'
end

Given(/^I am on the play page$/) do
  visit '/'
  fill_in "name", :with => "Anna"
  click_on "Play"
  swap_sessions
  visit '/'
  fill_in "name", :with => "Anna"
  click_on "Play"
end

Given(/^my opponent has not chosen an option yet$/) do
end

When(/^I click "(.*?)"$/) do |button|
  click_on button
end

When(/^click "(.*?)"$/) do |button|
  click_on button
end

Then(/^I go to the waiting_again page$/) do
  visit 'waiting_again'
end

Given(/^I am on the waiting_again page$/) do
  visit 'waiting_again'
end

Given(/^I chose "(.*?)"$/) do |link|
  click_on link
end

Then(/^I go to the finale page$/) do
  visit '/waiting_again'
end

When(/^I click on "(.*?)"$/) do |button|
  click_on button
end

When(/^I choose "(.*?)"$/) do |link|
  click_image link
end