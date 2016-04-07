class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :destination_id
      t.string :name
      t.integer :cost
      t.integer :rigor
      t.integer :min_group_size

      t.timestamps null: false
    end
  end
end
