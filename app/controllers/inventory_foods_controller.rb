class InventoryFoodsController < ApplicationController

  def new
    @inventory_food = InventoryFood.new
    @inventory, = Inventory.where(id: params[:inventory_id], user: current_user)
  end

  def create
    @inventory, = Inventory.where(id: params[:inventory_id], user: current_user)
    @inventory_food = InventoryFood.new(create_params)
    if @inventory_food.save
      redirect_to(inventory_path(@inventory))
    else
      render(:new, alert: 'Nothing was Added')
    end
  end

  def destroy
    @inventory_food, = RecipeFood.where(params.permit(:id, :inventory_id))
    @inventory_food.destroy
    redirect_to(inventory_path(params[:inventory_id]))
  end

  private

  def create_params
    params.permit(:quantity, inventory_id)
  end
end
