Feature: Starting a game
  In order to play Rock, Paper, Scissors
  I want to register and start a new game

Scenario: Homepage
  Given I am on the homepage
  Then I should see "Welcome to Rock, Paper, Scissors!"
  And I should see "Please, enter your name."

Scenario: Empty name
  Given I am on the homepage
  When I don't fill in "name"
  Then I should see "You did not enter a name."