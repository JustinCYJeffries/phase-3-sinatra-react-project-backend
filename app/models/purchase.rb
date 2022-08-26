class Purchase < ActiveRecord::Base
    belongs_to :crypto
    belongs_to :portfolio

    def update_profit
        self.profit = ((self.purchase_price - self.crypto.price) * self.amount_purchaced) unless self.sold
        self.save
    end
end