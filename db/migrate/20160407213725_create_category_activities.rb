class CreateCategoryActivities < ActiveRecord::Migration
  def change
    create_table :category_activities do |t|
      t.integer :category_id
      t.integer :activity_id

      t.timestamps null: false
    end
  end
end
