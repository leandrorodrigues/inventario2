class Device < ApplicationRecord
  belongs_to :item
  belongs_to :device_model
  def to_s
    self.title
  end
end
