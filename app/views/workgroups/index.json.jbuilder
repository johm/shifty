json.array!(@workgroups) do |workgroup|
  json.extract! workgroup, :id, :name
  json.url workgroup_url(workgroup, format: :json)
end
