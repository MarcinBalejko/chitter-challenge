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

    post '/chits' do
        text = params['text']
        connection = PG.connect(dbname: 'chitter_test')
        connection.exec("INSERT INTO chits (text) VALUES('#{text}');")
        redirect '/chits'
    end
    

    run! if app_file == $0
end

