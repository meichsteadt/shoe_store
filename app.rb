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

get '/stores/new' do
  @shoes = Shoe.all
  erb :store_form
end

post '/stores' do
  new_store = Store.create(name: params[:name])
  params[:shoes].each do |shoe|
    new_store.shoes.push(Shoe.find(shoe.to_i))
  end
  if new_store.save
    redirect('/stores')
  else
    erb :store_form
  end
end

get '/stores/:id' do
  @store = Store.find(params[:id].to_i)
  erb :store
end

get '/stores/:id/update' do
  @store = Store.find(params[:id].to_i)
  @shoes = Shoe.all
  @update = true
  erb :store_form
end

patch '/stores/:id' do
  store = Store.find(params[:id].to_i)
  store.update(name: params[:name])
  if params[:shoes]
    store.shoes.each do |shoe|
      if !params[:shoes].include?(shoe.id)
        store.shoes.destroy(shoe.id)
      end
    end
    params[:shoes].each do |shoe|
      if !store.shoes.include?(Shoe.find(shoe.to_i))
        store.shoes.push(Shoe.find(shoe.to_i))
      end
    end
  else
    store.shoes.length.times do |time|
      store.shoes.destroy(store.shoes[0])
    end
  end
  if store.save
    redirect('/stores/' + store.id.to_s)
  else
    erb :store_form
  end
end

delete '/stores/:id' do
  store = Store.find(params[:id])
  store.destroy
  if store.destroy
    redirect('/stores')
  else
    erb :store
  end
end

get '/shoes' do
  @shoes = Shoe.all
  erb :shoes
end

get '/shoes/new' do
  @stores = Store.all
  erb :shoe_form
end

post '/shoes' do
  new_shoe = Shoe.create(name: params[:name])
  params[:stores].each do |store|
    new_shoe.shoes.push(Store.find(store.to_i))
  end
  if new_shoe.save
    redirect('/shoes')
  else
    erb :shoe_form
  end
end

get '/shoes/:id' do
  @shoe = Shoe.find(params[:id].to_i)
  erb :shoe
end


get '/shoes/:id/update' do
  @shoe = Shoe.find(params[:id].to_i)
  @update = true
  erb :shoe_form
end

patch '/shoes/:id' do
  shoe = Shoe.find(params[:id].to_i)
  shoe.update(name: params[:name])
  params[:stores].each do |store|
    new_shoe.shoes.push(store)
  end
  if new_shoe.save
    redirect('/shoes')
  else
    erb :shoe_form
  end
end

delete '/shoe' do
  shoe = Shoe.find(params[:id])
  shoe.destroy
  if new_shoe.destroy
    redirect('/shoes')
  else
    erb :shoe
  end
end

get '/public/css/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :"stylesheets/#{params[:name]}", Compass.sass_engine_options
end
