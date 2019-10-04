require 'sinatra/base'
require 'sinatra/flash'
require './lib/chit'

class Chitter < Sinatra::Base
    enable :sessions, :method_override
    register Sinatra::Flash

    get '/' do
        erb :'main_page'
    end

    get '/chits' do
        @chits = Chit.all
        erb :'chitts/index'
    end

    run! if app_file == $0
end

