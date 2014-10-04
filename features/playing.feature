Feature: Playing the game
  In order to find out who the winner is
  I need to choose one option

Scenario: Waiting for opponent to join
  Given I am on the waiting page
  When the second player joins the game
  Then I do to the play page
  And I see "Great! Let's play!!! Go on and choose one option!"

Scenario: Waiting for opponent to pick
  Given I am on the play page
  And my opponent has not chosen an option yet
  When I choose "Paper"
  And I click "Submit"
  Then I go to the waiting_again page
  And I see "Waiting for opponent to pick"

Scenario: I win
  Given I am on the waiting_again page
  And I chose "Paper"
  And opponent chose "Rock"
  Then I go to the finale page
  And I see "Congratulations!!! You won!!!"

Scenario: I loose
  Given I am on the waiting_again page
  And I chose "Paper"
  And opponent chose "Scissors"
  Then I go to the finale page
  And I see "Sorry you lost. Better luck next time."

Scenario: Draw
  Given I am on the waiting_again page
  And I chose "Paper"
  And opponent chose "Paper"
  Then I go to the finale page
  And I see "It's a draw!"
