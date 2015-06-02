json.array!(@shift_templates) do |shift_template|
  json.extract! shift_template, :id, :name, :notes
  json.url shift_template_url(shift_template, format: :json)
end
