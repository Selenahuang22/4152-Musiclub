class OrderDetail < ActiveRecord::Base

    belongs_to :music
    belongs_to :account
    
end
