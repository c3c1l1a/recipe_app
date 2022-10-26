class Food < ApplicationRecord
	belongs_to :user
	has_one :recipe, through: :recipe_food
end
