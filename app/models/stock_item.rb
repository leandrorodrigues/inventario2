class StockItem < ApplicationRecord
  belongs_to :item, required: false
  def to_s
    self.title
  end
end
