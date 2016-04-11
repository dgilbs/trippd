class AddsCurrentTripToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_trip_id, :integer
  end
end
