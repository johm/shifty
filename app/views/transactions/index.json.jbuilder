json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :amount_in_cents, :date_made, :worker_id, :notes
  json.url transaction_url(transaction, format: :json)
end
