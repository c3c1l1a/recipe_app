class Food < ApplicationRecord
  has_many :inventory_foods, dependent: :destroy
  has_many :Inventories, through: :inventory_foods

  validates :name, presence: { message: "Name can't be null" }, length: { in: 3..10 }
  validates :measurement_unit, presence: { message: "Measurement unit can't be null" }
  validates :price, presence: { message: "Price can't be null" }
  validates :price, numericality: { only_float: true, greater_than: 0, message: 'Price must be greater than 0' }
end
