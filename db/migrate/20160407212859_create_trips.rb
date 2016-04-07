class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :user_id
      t.integer :budget
      t.date :start_date
      t.date :end_date
      t.integer :total_guests

      t.timestamps null: false
    end
  end
end
