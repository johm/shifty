json.array!(@week_notes) do |week_note|
  json.extract! week_note, :id, :note, :monday, :author
  json.url week_note_url(week_note, format: :json)
end
