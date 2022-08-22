class Portfolio < ActiveRecord::Base
    has_many :cryptos
    has_many :cryptos, through: :purchases
end