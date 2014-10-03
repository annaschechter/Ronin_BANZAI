require 'sinatra/base'

class RPS < Sinatra::Base

  set :views, Proc.new { File.join(root, '..', "views") }
  enable :sessions

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
    "Well done!"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
