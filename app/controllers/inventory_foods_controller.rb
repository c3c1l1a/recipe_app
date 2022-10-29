class InventoryFoodsController < ApplicationController
  before_action :authenticate_user!

  def new
    @foods = Food.select('id, name').all
    @inventory = Inventory.find(params[:inventory_id])
    @inventory_food = @inventory.inventory_foods.new
  end

  def create
    @inventory = Inventory.find(params[:inventory_id])
    @inventory_food = @inventory.inventory_foods.create(inventory_foods_params)
    flash[:notice] = 'Inventory created sucessfully.' if @inventory_food.save
    redirect_to @inventory
  end

  def destroy
    @inventory_food = InventoryFood.find(params[:id])
    @inventory_food.destroy
    flash[:success] = 'Inventory Food deleted successfully.'
    redirect_to inventory_path(@inventory_food.inventory_id)
  end

  private

  def inventory_foods_params
    params.require(:inventory_food).permit(:quantity, :food_id)
  end
end
