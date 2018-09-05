class DeviceModel < ApplicationRecord
  belongs_to :device_brand
  belongs_to :device_type
end
