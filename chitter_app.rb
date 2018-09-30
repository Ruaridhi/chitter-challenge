require 'sinatra/base'
require './lib/chitter'

# This is the controller for our Chitter app
class ChitterApp < Sinatra::Base
  get '/' do
    @peeps = PostPeep.show.reverse
    erb :index
  end

  post '/' do
    PostPeep.post(params[:message])
    @peeps = PostPeep.show.reverse
    erb :index
  end

  run! if app_file == $PROGRAM_NAME
end
