class PayRate < ActiveRecord::Base
  belongs_to :worker
  monetize :hourly_pay_in_cents, :as => "hourly_pay"
  monetize :hourly_capital_contribution_in_cents, :as => "hourly_capital_contribution"
  monetize :hourly_predicted_extra_wage_in_cents, :as => "hourly_predicted_extra_wage"


end
