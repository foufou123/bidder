json.array!(@contractors) do |contractor|
  json.extract! contractor, :id, :user_id, :organization_type, :organization_name, :summary
  json.url contractor_url(contractor, format: :json)
end
