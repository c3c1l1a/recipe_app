class PublicRecipesController < ApplicationController
	# GET /foods or /foods.json
  def index
    @foods = Food.all
  end
end