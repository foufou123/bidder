json.array!(@jobs) do |job|
  json.extract! job, :id, :name, :description, :phone, :location, :zipcode
  json.url job_url(job, format: :json)
end
