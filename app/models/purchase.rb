class Purchase < ActiveRecord::Base
    belongs_to :crypto
    belongs_to :portfolio

    
end