require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base
    enable :sessions, :method_override
    register Sinatra::Flash

    get '/' do
        erb :'main_page'
    end

    run! if app_file == $0
end

