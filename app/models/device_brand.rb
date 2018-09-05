class DeviceBrand < ApplicationRecord
  def to_s
    self.title
  end
end
