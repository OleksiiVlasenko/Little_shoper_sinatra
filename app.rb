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

class Order < ActiveRecord::Base

end



get '/' do
  @product = Product.all
  erb :index
end

def parse_orders order_input
  arr = []
  s1 = order_input.split(/,/)

  s1.each do |x|
    s2 = x.split(/\=/)
    key = s2[0]
    value = s2[1]
    arr2 = [key ,value]
    arr.push arr2
end
return arr
end


post '/cart' do
  @orders = params['orders1']
  @s1 = @orders.split(/,/)
  @orders_input = params['orders1']
  @items = parse_orders @orders_input
  
  @items.each do |item|
    item[0] = Product.find(item[0])
  end




  # @order = Order.new params[:order]
  
  erb :cart
end


post '/post_orders' do
  new_order = Order.new params[:order]
  if new_order.save
  @error = "Your order is save"
  erb:post_orders
else 
  @error = "Your order is NOT save"

end
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
