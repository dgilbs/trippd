class PackingListsController < ApplicationController

  def create
    @packing_list = PackingList.new(packing_list_params)
    @packing_list.user_id = current_user.id 
    @packing_list.save
    render json: @packing_list
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def packing_list_params
    params.permit(:name, :trip_id)
  end

end