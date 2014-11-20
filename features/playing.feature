Feature: Playing the game
  In order to find out who the winner is
  I need to choose one option

Scenario: Waiting for opponent to join
  Given I am on the waiting page
  When the second player joins the game
  Then I see Great! Let's play!!! Go on and choose one option!