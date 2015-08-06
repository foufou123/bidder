json.array!(@bids) do |bid|
  json.extract! bid, :id, :job_id, :user_id, :price
  json.url bid_url(bid, format: :json)
end
