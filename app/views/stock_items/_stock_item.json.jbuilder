json.extract! stock_item, :id, :title, :item_id, :quantity, :is_package, :package_quantity, :created_at, :updated_at
json.url stock_item_url(stock_item, format: :json)
