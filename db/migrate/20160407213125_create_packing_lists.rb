class CreatePackingLists < ActiveRecord::Migration
  def change
    create_table :packing_lists do |t|
      t.integer :user_id
      t.integer :trip_id
      t.string :name

      t.timestamps null: false
    end
  end
end
