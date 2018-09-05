json.extract! device_model, :id, :title, :device_brand_id, :device_type_id, :rack_units, :ethernet_interfaces, :fiber_interfaces, :stock_unit, :created_at, :updated_at
json.url device_model_url(device_model, format: :json)
