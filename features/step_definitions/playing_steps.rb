
def in_browser(name)
  old_session = Capybara.session_name
  Capybara.session_name = name
  yield
  Capybara.session_name = old_session
end

Given(/^I am on the waiting page$/) do
  in_browser(:one) do
  visit '/'
  fill_in "name", :with => "Anna"
  click_on "Play"
  end
end

When(/^the second player joins the game$/) do
  in_browser(:two) do
  visit '/'
  fill_in "name", :with => "Bob"
  click_on "Play"
  end
end

Then(/^I see "(.*?)"$/) do |text|
  in_browser(:one) do
  expect(page).to have_content text
  end
end

Then(/^I do to the play page$/) do
  in_browser(:one) do
  visit '/play'
  end
end

Given(/^my opponent has not chosen an option yet$/) do
  in_browser(:one) do
  visit '/'
  fill_in "name", :with => "Anna"
  click_on "Play"
  end
  in_browser(:two) do
  visit '/'
  fill_in "name", :with => "Bob"
  click_on "Play"
  end
end

When(/^I choose "(.*?)"$/) do |button|
  in_browser(:one) do
  click_on button
  end
end

Then(/^I go to the waiting_again page$/) do
  in_browser(:one) do
  visit '/waiting_again' 
  end
end

Given(/^the opponent chose "(.*?)"$/) do |button|
  in_browser(:one) do
  visit '/'
  fill_in "name", :with => "Anna"
  click_on "Play"
  end
  in_browser(:two) do
  visit '/'
  fill_in "name", :with => "Bob"
  click_on "Play"
  click_on button
  end
end

When(/^I chose "(.*?)"$/) do |button|
  in_browser(:one) do
  click_on button
  end
end


