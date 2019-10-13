require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require_relative './lib/chit'
require_relative './lib/timecalculator'
require_relative './database_connection_setup.rb'
require_relative './lib/user'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :'main_page'
  end

  get '/chits' do
    @user = User.find(id: session[:user_id])
    @chits = Chit.all
    
    erb :'chits/index'
  end

######################### MY CHITS ###############

  get '/chits/my' do
    @user = User.find(id: session[:user_id])
    @chits = Chit.all

    erb :'chits/my_chits'
  end

  delete '/chits/my/:id' do
    Comment.delete_with_chit(id: params[:id])
    Chit.delete(id: params[:id])
    redirect '/chits/my'
  end


  ########## C O M M E N T S #####################

  get '/chits/:id/comments/new' do
    @chit_id = params[:id]
    erb :'comments/new'
  end

  post '/chits/:id/comments' do
    @user = User.find(id: session[:user_id])
    @chits = Chit.all
    @author = @user.name
    Comment.create(chit_id: params[:id], text: params[:comment], comment_author: @author)
    redirect '/chits'
  end

  delete '/chits/:id/comments' do
    
    Comment.delete(id: params[:id])
    redirect '/chits'
  end
  



  ###############################



  get '/chits/new' do
    erb :'chits/new'
  end

  post '/chits' do
    @user = User.find(id: session[:user_id])
    @time = TimeCalculator.show_time
    Chit.create(text: params[:text], time: @time, author_id: session[:user_id], author_email: @user.email, author_name: @user.name)
    redirect '/chits'
  end

  delete '/chits/:id' do
    Comment.delete_with_chit(id: params[:id])
    Chit.delete(id: params[:id])
    redirect '/chits'
  end

  get '/chits/:id/edit' do
    @chit = Chit.find(id: params[:id])
    erb :"chits/edit"
  end

  patch '/chits/:id' do
    @user = User.find(id: session[:user_id])
    @time_updated = TimeCalculator.show_time
    Chit.update(id: params[:id], text: params[:text], time: (@time_updated + ' (edited)'),  author_id: session[:user_id], author_email: @user.email, author_name: @user.name)
    redirect('/chits')   # (+ put time in other place, 
    # test for time, update tests, wall page for each user, delete edit from the main page, design and build UI)
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(email: params['email'], password: params['password'], name: params['name'])
    session[:user_id] = user.id
    redirect '/chits'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/chits')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end
  
  post '/sessions/destroy' do
    session.clear
    #flash[:notice] = 'You have signed out.'
    redirect('/')
  end


  run! if app_file == $0
end