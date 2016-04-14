class ItemsController < ApplicationController

  def create
    @item = Item.create(items_params)
    render json: @item 
  end


  private

  def items_params
    params.permit(:name, :packing_list_id)
  end

end