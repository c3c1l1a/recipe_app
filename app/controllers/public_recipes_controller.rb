class PublicRecipesController < ApplicationController
	# GET /foods or /foods.json
  before_action :set_public_recipes

  def index
    @foods = Food.all
  end

  private 

  def set_public_recipes 
    @public_recipes = P
  end


end