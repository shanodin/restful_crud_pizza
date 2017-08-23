require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative("./models/pizza.rb")

# index route
get "/pizzas" do
  @pizza = Pizza.all()
  erb( :index )
end

# new route
get "/pizzas/new" do
  erb( :new )
end

# create route
post "/pizzas" do
  @pizza = Pizza.new( params )
  @pizza.save
  erb( :create )
end

# show route
get "/pizzas/:id" do
  @pizza = Pizza.find(params[:id])
  erb( :show )
end

# delete route
post "/pizzas/:id/deleted" do
  @pizza = Pizza.find(params[:id])
  @pizza.delete
  # erb( :deleted )
  redirect to "/pizzas/new"
end

# edit route
post "/pizzas/:id/edit" do
  @pizza = Pizza.find(params[:id])
  @pizza.update()
  erb( :update )
end

# update route
post "/pizzas/:id" do
  @pizza = Pizza.new(params)
  @pizza.update
  # erb( :updated )
  redirect to "/pizzas/#{@pizza.id}"
end
