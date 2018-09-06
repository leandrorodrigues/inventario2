class Container < ApplicationRecord
  belongs_to :place
  belongs_to :item
  belongs_to :container_type
  belongs_to :container
  def to_s
    self.title
  end
end
