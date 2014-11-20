def in_browser(name)
  old_session = Capybara.session_name
  Capybara.session_name = name
  yield
  Capybara.session_name = old_session
end

Given(/^I am on the waiting page$/) do
  in_browser(:five) do
    visit '/'
    fill_in "name", :with => "Anna"
    click_on "Play"
  end
end

When(/^the second player joins the game$/) do
  in_browser(:six) do
    visit '/'
    fill_in "name", :with => "Bob"
    click_on "Play"
  end
end

Then(/^I see Great! Let's play!!! Go on and choose one option!$/) do
  in_browser(:five) do
    sleep 10
    save_and_open_page
    expect(page).to have_content "Great! Let's play!!! Go on and choose one option!"
  end
end


