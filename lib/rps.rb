require 'sinatra/base'

class RPS < Sinatra::Base

  set :views, Proc.new { File.join(root, '..', "views") }

  get '/' do
    erb :index
  end

  post '/create_player' do
    "Well done!"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
