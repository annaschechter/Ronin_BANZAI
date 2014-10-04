require 'game'

describe Game do 

let(:game){Game.new}
let(:option1) {double :option, :name => :rock}
let(:option2) {double :option, :name => :paper}
let(:player1){double :player, :has_played? => true, :option => option1}
let(:player2){double :player, :has_played? => false, :option => option2}


  it "should initialize with no players" do
  	expect(game).to_not have_two_players
  end

  it "should be able to add players" do
  	2.times{game.add_player(player1)}
  	expect(game).to have_two_players
  end

  it "should know when both players have played" do
    2.times{game.add_player(player1)}
    expect(game.both_players_played).to eq(true)
  end

  it "should know when not both players have played" do
    game.add_player(player1)
    game.add_player(player2)
    expect(game.both_players_played).to_not eq(true)
  end

  it "should know when it's ready to present the result" do
    2.times{game.add_player(player1)}
    expect(game).to be_ready
  end	

  it "should know when it's not ready to present the result" do
    game.add_player(player1)
    game.add_player(player2)
    expect(game).to_not be_ready
  end

  it "should know when it is a draw" do
    2.times{game.add_player(player1)}
    expect(game.winner).to eq(:draw)
  end

  it "should know when one of the players has to win" do
    game.add_player(player1)
    game.add_player(player2)
    expect(game.winner).to eq(:player2)
  end
end