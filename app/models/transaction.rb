class Transaction < ActiveRecord::Base
  belongs_to :worker
  monetize :amount_in_cents, :as => "amount"
  
  
end
