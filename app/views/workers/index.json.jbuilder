json.array!(@workers) do |worker|
  json.extract! worker, :id, :firstname, :lastname, :mobile, :email, :foreground, :background
  json.url worker_url(worker, format: :json)
end
