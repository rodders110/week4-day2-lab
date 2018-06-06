require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('models/pizza_order')
also_reload('./models/*')

get '/pizza-orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end

get '/pizza-orders/new' do
  erb(:new)
end

get '/pizza-orders/edit' do
  erb(:edit)
end

get '/pizza-orders/delete' do
  erb(:delete)
end

get '/pizza-orders/:id' do
@orders =  PizzaOrder.find(params[:id])
erb(:show)
end

post '/delete-order' do
  PizzaOrder.delete_by_id(params[:id])
  erb(:deleted)
end

post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

post '/edit-order' do
  @order = PizzaOrder.new(params)
  @order.id = PizzaOrder.find_id(@order)
  @order.update()
  erb(:create)

end
