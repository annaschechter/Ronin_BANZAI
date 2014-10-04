require 'sinatra/base'
require_relative 'game'

class RPS < Sinatra::Base

  set :views, Proc.new { File.join(root, '..', "views") }
  enable :sessions

  GAME = Game.new

  get '/' do
  	@name = session[:name]
    erb :index
  end

  post '/create_player' do
    if params[:name] == ""
       session[:name] = "default"
       redirect '/'
    end 
    session[:name] = params[:name]
    player = Player.new
    player.name = params[:name]
    GAME.add_player(player)
    if GAME.has_two_players?
      session[:current_player] = :player2
    else
      session[:current_player] = :player1
    end
    redirect '/waiting'
  end

  get '/waiting' do
    redirect '/play' if GAME.has_two_players?
    @name = session[:name]
    erb :waiting
  end

  get '/play' do
    erb :play
  end

  get '/result' do
    @option = Option.new(params[:object])

    if session[:current_player] == :player1
      GAME.player1.pick(@option)
    else
      GAME.player2.pick(@option)
    end
    redirect '/waiting_again'
  end

  get '/waiting_again' do
    redirect '/actual_result' if GAME.ready?
    erb :waiting_again
  end

  get '/actual_result' do
    @player = session[:current_player]

    if (@player == :player1 && GAME.winner == :player1) || (@player == :player2 && GAME.winner == :player2)
      redirect '/win'
    elsif (@player == :player1 && GAME.winner == :player2) || (@player == :player2 && GAME.winner == :player1)
      redirect '/lost'
    else 
      redirect '/draw'
    end
  end

  get '/win' do
    "Congratulations!!! You won!!!"
  end

  get '/lost' do
    "Sorry you lost. Better luck next time."
  end

  get '/draw' do
    "You drew!"
  end


  # start the server if ruby file executed directly
  run! if app_file == $0

end
