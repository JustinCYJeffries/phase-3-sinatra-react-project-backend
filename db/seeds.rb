require 'cryptocompare'

puts "🌱 Seeding spices..."

cryptolist = Cryptocompare::CoinList.all
cryptoKeys = cryptolist["Data"].keys
cryptoKeys.each do |crypt|
    Crypto.create(
        name: cryptolist["Data"][`${crypt}`]["FullName"]
        ticker: crypt
        price: Cryptocompare::Price.full(`${crypt}`, 'USD')["RAW"][`${crypt}`]["USD"]["PRICE"]
        volume: Cryptocompare::Price.full(`${crypt}`, 'USD')["RAW"][`${crypt}`]["USD"]["VOLUME24HOUR"]
    )

puts "✅ Done seeding!"
