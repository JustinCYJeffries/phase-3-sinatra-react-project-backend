class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  #portfolio routes
  get '/portfolios' do
    portfolios = Portfolio.all.includes(:purchases)
    portfolios.to_json(include: :purchases) 
  end
  get '/portfolios/:id' do
    portfolio = Portfolio.find(params[:id])
    portfolio.to_json(include: :purchases) 
  end
  get '/portfolios/:id/:cid' do
    portfolio = Portfolio.find(params[:id]).purchases.where(crypto_id: params[:cid])
    portfolio.to_json 
  end
  post '/portfolios' do
    portfolio = Portfolio.create(
      name: params[:name]
    )
    portfolio.to_json
  end
  #crypto routes
  get '/cryptos' do
    cryptos = Crypto.all
    cryptos.to_json
  end
  get '/cryptos/:id' do
    crypto = Crypto.find(params[:id])
    crypto.to_json
  end
  #purchase routes
  get '/purchases' do
    purchases = Purchase.all
    purchases.each do |p|
      p.update_profit
    end
    purchases.to_json
  end
  get '/purchases/:id' do
    purchase = Purchase.find(params[:id])
    purchase.update_profit
    purchase.to_json
  end
  patch '/purchases/:id' do
    purchase = Purchase.find(params[:id])
    purchase.update_profit
    purchase.update(params)
    purchase.to_json
  end
  delete '/purchases/:id' do
    purchase = Purchase.find(params[:id])
    purchase.destroy
    purchase.to_json
  end
  post '/purchases' do
    purchase = Purchase.create(params)
    purchase.update_profit
    portfolio.to_json
  end




  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

end
