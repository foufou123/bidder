json.array!(@contracts) do |contract|
  json.extract! contract, :id, :user_id, :job_id, :bid_id, :binding_bid, :conditions
  json.url contract_url(contract, format: :json)
end
