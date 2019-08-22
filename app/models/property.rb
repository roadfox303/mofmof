class Property < ApplicationRecord
  after_initialize :init
  def init
    self.note  ||= " "
  end
  has_many :stations
  accepts_nested_attributes_for :stations, allow_destroy: true
  with_options presence: true do
    validates :name
    validates :address
    validates :price
    validates :building_year
  end
end
