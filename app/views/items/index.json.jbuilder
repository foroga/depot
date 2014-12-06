json.array!(@items) do |item|
  json.extract! item, :id, :order_id, :supplier_id, :product_id, :name, :note, :minall, :mingroup, :minunit, :kgxunit, :unittype, :price
  json.url item_url(item, format: :json)
end
