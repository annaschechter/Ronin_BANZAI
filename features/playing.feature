Feature: Playing the game
  In order to find out who the winner is
  I need to choose one option

Scenario: Waiting for opponent to join
  Given I am on the waiting page
  When the second player joins the game
  Then I go to the play page
  And I see "Great! Let's play!!! Go on and choose one option!"

Scenario: Waiting for opponent to pick
  Given my opponent has not chosen an option yet
  When I choose "paper"
  Then I go to the waiting_again page
  And I see "Waiting for opponent to pick"

Scenario: Draw
  Given the opponent chose "paper"
  When I chose "paper"
  Then I see "It's a draw!"

Scenario: I win
  Given the opponent chose "paper"
  When I chose "scissors"
  Then I see "Congratulations!!! You won!!!"

Scenario: I loose
  Given the opponent chose "paper"
  When I chose "rock"
  Then I see "Sorry you lost. Better luck next time."
