class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # GET /bakeries
  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  # GET /bakeries/:id
  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery_with_goods = bakery.to_json(include: :baked_goods)
    bakery_with_goods
  end

  # GET /baked_goods/by_price
  get '/baked_goods/by_price' do
    baked_goods = BakedGood.order(price: :desc).all
    baked_goods.to_json
  end

  # GET /baked_goods/most_expensive
  get '/baked_goods/most_expensive' do
    most_expensive_good = BakedGood.order(price: :desc).first
    most_expensive_good.to_json
  end
end
