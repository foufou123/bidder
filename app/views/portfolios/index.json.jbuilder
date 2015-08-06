json.array!(@portfolios) do |portfolio|
  json.extract! portfolio, :id, :contractor_id
  json.url portfolio_url(portfolio, format: :json)
end
