#encoding: UTF-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'net/smtp'
require 'sqlite3'
require 'sinatra/activerecord'

set :database, "sqlite3:shoper.db"


configure do
  enable :sessions
end

helpers do
  def username
    session[:identity] ? session[:identity] : 'Hello stranger'
  end
end

before '/secure/*' do
  unless session[:identity]
    session[:previous_url] = request.path
    @error = 'Sorry, you need to be logged in to visit ' + request.path
    halt erb(:login_form)
  end
end


class Product < ActiveRecord::Base

end



get '/' do
  @product = Product.all
  erb :index
end



post '/cart' do
   @orders = params['orders1']
   

  erb :cart
end

get '/cart' do

  # @orders = params['orders1']
  # order = orders.split(',')
  #  @id = 1step[0]
  #  @count = 1step[1]

  erb :cart
end


get '/about' do
  erb :about
end

get '/login/form' do
  erb :login_form
end

post '/login/attempt' do
  session[:identity] = params['username']
  where_user_came_from = session[:previous_url] || '/'
  redirect to where_user_came_from
end

get '/logout' do
  session.delete(:identity)
  erb "<div class='alert alert-message'>Logged out</div>"
end

get '/secure/place' do
  erb 'This is a secret place that only <%=session[:identity]%> has access to!'
end
