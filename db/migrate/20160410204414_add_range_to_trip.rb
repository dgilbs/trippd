class AddRangeToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :range, :string
  end
end
