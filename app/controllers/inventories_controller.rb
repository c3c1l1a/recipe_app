class InventoriesController < ApplicationController
  # before_action :set_user
  # before_action :set_inventory, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!

  # GET users/1/inventories
  def index
    @inventories = Inventory
    .includes(:user)
    .where(user: current_user)
  end

  # GET users/1/inventories/1
  def show
    @inventory = Inventory.where(id: params[:id], user: current_user)
  end

  # GET users/1/inventories/new
  def new
   # @inventory.user_id = current_user.id
    @inventory = Inventory.new
  end

  # GET users/1/inventories/1/edit
  def edit
  end

  # POST users/1/inventories
  def create
    @inventory = Inventory.new(inventory_params)

    if @inventory.save
      redirect_to(inventories_path, notice: 'Inventory was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT users/1/inventories/1
=begin
  def update
    if @inventory.update_attributes(inventory_params)
      redirect_to([@inventory.user, @inventory], notice: 'Inventory was successfully updated.')
    else
      render action: 'edit'
    end
  end
=end
  # DELETE users/1/inventories/1
  def destroy
    @inventory = Inventory.where(id: params[:id], user: current_user)
    @inventory.destroy
    redirect_to inventories_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
=begin
    def set_user
      @user = User.find(set_params)
    end

    def set_params
      {
        user: current_user
      }
    end
=end
=begin
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end
=end

    # Only allow a trusted parameter "white list" through.
    def inventory_params
      params
      .require(:inventory)
      .permit(:name, :user_id)
      .merge(user: current_user)
    end
end
