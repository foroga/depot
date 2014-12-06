json.array!(@requests) do |request|
  json.extract! request, :id, :item_id, :unit_id, :requested, :received, :priceini, :priceend
  json.url request_url(request, format: :json)
end
