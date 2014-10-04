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

Scenario: No opponent
    Given I am on the homepage 
    And there are no opponents
    When I fill in "name" with "Anna"
    And I click on "Play"
    Then I go to the welcome page 

  Scenario: Opponent exists
    Given I am on the homepage
    When I fill in "name" with "Anna"
    And I click on "Play"
    Then I go to the place_ships page

