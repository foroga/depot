json.array!(@accounts) do |account|
  json.extract! account, :id, :date, :concept, :amountini, :amountend, :state, :note
  json.url account_url(account, format: :json)
end
