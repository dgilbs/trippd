class CreateTripDestinations < ActiveRecord::Migration
  def change
    create_table :trip_destinations do |t|
      t.integer :trip_id
      t.integer :destination_id

      t.timestamps null: false
    end
  end
end
