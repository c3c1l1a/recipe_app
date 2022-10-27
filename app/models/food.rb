class Food < ApplicationRecord
  	has_many :inventory_foods
	belongs_to :user
	has_one :recipe, through: :recipe_food
end
