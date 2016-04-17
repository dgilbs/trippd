class ItemsController < ApplicationController

  def create
    @item = Item.create(items_params)
    render json: @item 
  end

  def destroy
    @item = Item.find(params[:id])
    @packing_list = @item.packing_list
    @item.destroy
  end


  private

  def items_params
    params.permit(:name, :packing_list_id)
  end

end