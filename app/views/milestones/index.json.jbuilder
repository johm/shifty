json.array!(@milestones) do |milestone|
  json.extract! milestone, :id, :name, :description, :date_reached, :worker_id
  json.url milestone_url(milestone, format: :json)
end
