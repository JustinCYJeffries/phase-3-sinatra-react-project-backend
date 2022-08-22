class Portfolio < ActiveRecord::Base
    has_many :purchases
    has_many :cryptos, through: :purchases
end