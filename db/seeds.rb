require 'cryptocompare'
require 'faker'

puts "🌱 Seeding spices..."

all = Cryptocompare::CoinList.all
coin_array = all["Data"].to_a.map{|i| i.last}.sort_by{|i| i["SortOrder"].to_i}.first(9)
coin_array.each do |crypt|
    puts crypt["Symbol"]
    Crypto.create(
        name: crypt["FullName"],
        ticker: crypt["Symbol"],
        price: Cryptocompare::Price.full("#{crypt["Symbol"]}", 'USD')["RAW"]["#{crypt["Symbol"]}"]["USD"]["PRICE"],
        volume: Cryptocompare::Price.full("#{crypt["Symbol"]}", 'USD')["RAW"]["#{crypt["Symbol"]}"]["USD"]["VOLUME24HOUR"]
        )
        
end

10.times do 
    Portfolio.create(
       name: Faker::Name.name
    )
end


50.times do
    crypt = Crypto.all.sample
    sells = Faker::Boolean.boolean
    Purchase.create(
        sold: sells,
        amount_purchaced: Faker::Number.between(from: 1, to: 30),
        purchase_price: Cryptocompare::PriceHistorical.find("#{crypt.ticker}", 'USD', {'ts' => Faker::Time.between(from: DateTime.now - 60, to: DateTime.now - 30).to_i.to_s})["#{crypt.ticker}"]["USD"],
        profit: (Cryptocompare::PriceHistorical.find("#{crypt.ticker}", 'USD', {'ts' => Faker::Time.between(from: DateTime.now - 30, to: DateTime.now).to_i.to_s})["#{crypt.ticker}"]["USD"] if sells),
        crypto_id: crypt.id,
        portfolio_id: Portfolio.all.map{|i| i.id}.sample
    )
end
puts "✅ Done seeding!"
