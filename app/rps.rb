require 'sinatra/base'
require_relative 'models/game'

class RPS < Sinatra::Base

  set :views, Proc.new { File.join(root, "views") }
  set :public_folder, Proc.new { File.join(root, "..", "public")}
  enable :sessions

  GAME = Game.new

  get '/' do
  	@name = session[:name]
    GAME.reset if GAME.has_two_players?
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
    session[:current_player] = player.object_id
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

  post '/result' do
    @option = Option.new(params[:weapon])
    @player = GAME.find_player_by(session[:current_player])
    @player.pick(@option)
    redirect '/waiting_again'
  end

  get '/waiting_again' do
    redirect '/finale' if GAME.ready?
    erb :waiting_again
  end

  get '/finale' do
    @player = session[:current_player]
    erb :finale
  end

  get '/reset' do
    session.clear
    redirect '/'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0

end
