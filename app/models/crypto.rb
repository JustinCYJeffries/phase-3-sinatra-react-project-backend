class Crypto < ActiveRecord::Base
    has_many :purchases
    has_many :portfolios, through: :purchases
end