json.array!(@shifts) do |shift|
  json.extract! shift, :id, :worker_id, :day_of_week, :monday, :start_time, :end_time, :task_id, :notes
  json.url shift_url(shift, format: :json)
end
