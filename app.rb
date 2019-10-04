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
        erb :'chits/index'
    end

    get'/chits/new' do
        erb :'chits/new'
    end

    post '/chits/new' do
        Chit.create(text: params[:text])
        redirect '/chits'
    end
    

    run! if app_file == $0
end

