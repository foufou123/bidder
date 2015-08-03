json.array!(@jobs) do |job|
  json.extract! job, :id, :name, :type, :description
  json.url job_url(job, format: :json)
end
