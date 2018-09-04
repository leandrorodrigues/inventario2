class Device < ApplicationRecord
  belongs_to :item
  belongs_to :device_model
end
