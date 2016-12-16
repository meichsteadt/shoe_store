require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  erb :index
end

get '/stores' do
  @stores = Store.all
  erb :stores
end

get '/stores/:id' do
  @store = Store.find(params[:id].to_i)
  erb :store
end

get '/stores/new' do
  erb :store_form
end

post '/store' do
  new_store = Store.create(name: params[:name])
  params[:shoes].each do |shoe|
    new_store.shoes.push(shoe)
  end
  if new_store.save
    redirect('/stores')
  else
    erb :store_form
  end
end

update '/store' do
  store = Store.find(params[:id])
  store.update(name: params[:name])
  params[:shoes].each do |shoe|
    new_store.shoes.push(shoe)
  end
  if new_store.save
    redirect('/stores')
  else
    erb :store_form
  end
end

delete '/store' do
  store = Store.find(params[:id])
  store.destroy
  if new_store.save
    redirect('/stores')
  else
    erb :store_form
  end
end

get '/public/css/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :"stylesheets/#{params[:name]}", Compass.sass_engine_options
end
