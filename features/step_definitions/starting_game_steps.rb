def in_browser(name)
  old_session = Capybara.session_name
  Capybara.session_name = name
  yield
  Capybara.session_name = old_session
end

Given(/^I am on the homepage$/) do
	in_browser(:one) do
  	visit '/'
	end
end

Then(/^I should see Welcome to Rock, Paper, Scissors!$/) do
	in_browser(:one) do
  	expect(page).to have_content "Welcome to Rock, Paper, Scissors!"
	end
end

Then(/^I should see Please, enter your name\.$/) do
  in_browser(:one) do
  	expect(page).to have_content "Please, enter your name."
	end
end

When(/^I don't fill in "(.*?)"$/) do |arg1|
  in_browser(:one) do
  	fill_in "name", :with => ""
 		click_on "Play"
 	end
end

Then(/^I should see You did not enter a name\.$/) do
  in_browser(:one) do
  	expect(page).to have_content "You did not enter a name."
	end
end

Given(/^there are no opponents$/) do
end

When(/^I visit the homepage$/) do
  in_browser(:two) do
  	visit '/'
  end
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  in_browser(:two) do
  	fill_in arg1, :with => arg2
  end
end

When(/^I click on "(.*?)"$/) do |button|
  in_browser(:two) do
  	click_on button
  end
end

Then(/^I go to the welcome page$/) do
  in_browser(:two) do
  	visit '/welcome'
  end
end

Given(/^an oponent exists$/) do
  in_browser(:three) do
  	visit '/'
  	fill_in "name", :with => "Bob"
  	click_on "Play"
  end
end

When(/^I register as "(.*?)"$/) do |arg1|
  in_browser(:four) do
  	visit '/'
  	fill_in "name", :with => "Anna"
  	click_on "Play"
  end
end

Then(/^I should see Great! Let's play!!!$/) do
    in_browser(:four) do
    	expect(page).to have_content "Great! Let's play!!!"
  end
end