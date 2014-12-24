require_relative 'player'
require_relative 'option'

class Game

  attr_accessor :player1, :player2

  def initialize
		@player1 = nil
		@player2 = nil
  end

  def has_two_players?
  	!(@player1 == nil || @player2 == nil)
  end

  def add_player(player)
      self.player1 ? self.player2 = player : self.player1 = player unless has_two_players?
  end

  def both_players_played
      @player1.has_played? && @player2.has_played?
  end

  def ready?
      has_two_players? && both_players_played
  end

  def winner
     return nil if @player1.option.name == @player2.option.name
     return @player1 if @player1.option.name == :rock && @player2.option.name == :scissors
     return @player1 if @player1.option.name == :scissors && @player2.option.name == :paper
     return @player1 if @player1.option.name == :paper && @player2.option.name == :rock
     return @player2
  end

  def players
    [@player1, @player2]
  end

  def find_player_by(player_object_id)
    return players.select{|player| player.object_id == player_object_id }.first
  end

  def reset
    @player1 = nil
    @player2 = nil
  end
  
end










