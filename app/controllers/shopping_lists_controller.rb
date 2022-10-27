class ShoppingListsController < ApplicationController
  def index
    @inventory = Inventory.find(params[:inventory_id])
    @inventory_foods = @inventory.inventory_foods
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = @recipe.recipe_foods
    @shopping_lists = @recipe_foods - @inventory_foods
    @total = sum(@shopping_lists)
  end

  def sum(shopping_lists)
    total = 0
    shopping_lists.each do |list|
      total += list.food.price * list.quantity
    end
    total
  end
end
