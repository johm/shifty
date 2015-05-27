json.array!(@pay_rates) do |pay_rate|
  json.extract! pay_rate, :id, :worker_id, :effective, :hourly_pay_in_cents, :hourly_capital_contribution_in_cents, :hourly_predicted_extra_wage_in_cents, :notes
  json.url pay_rate_url(pay_rate, format: :json)
end
