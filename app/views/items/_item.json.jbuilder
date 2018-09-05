json.extract! item, :id, :number, :title, :brand_name, :model_description, :serial_number, :warranty_date, :value, :net_value, :allocation, :created_at, :updated_at
json.url item_url(item, format: :json)
