class CreateTripActivities < ActiveRecord::Migration
  def change
    create_table :trip_activities do |t|
      t.integer :trip_id
      t.integer :activity_id

      t.timestamps null: false
    end
  end
end
