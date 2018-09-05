class Item < ApplicationRecord
  def to_s
    self.title
  end
end
