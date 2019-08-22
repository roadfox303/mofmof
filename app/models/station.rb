class Station < ApplicationRecord
  belongs_to :property, optional: true
  with_options presence: true do
    validates :line
    validates :name
    validates :walk_time
  end
end
