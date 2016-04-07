class CreateTripTags < ActiveRecord::Migration
  def change
    create_table :trip_tags do |t|
      t.integer :trip_id
      t.integer :tag_id

      t.timestamps null: false
    end
  end
end
