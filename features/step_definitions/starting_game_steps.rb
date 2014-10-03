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