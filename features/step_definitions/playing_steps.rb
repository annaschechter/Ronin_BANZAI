Given(/^I am on the waiting page$/) do
  visit '/waiting'
end

When(/^the second player joins the game$/) do
end

Then(/^I see "(.*?)"$/) do |text|
  expect(page).to have_content text
end

Then(/^I go to the play page$/) do
  visit '/play'
end

Given(/^I am on the play page$/) do
  visit '/play'
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

Given(/^I chose "(.*?)"$/) do |option|
  choose("Paper")
end

Given(/^opponent chose "(.*?)"$/) do |arg|
end

Then(/^I go to the finale page$/) do
  visit '/finale'
end

When(/^I click on "(.*?)"$/) do |button|
  click_on button
end