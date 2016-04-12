class ChangeTypeCostActivities < ActiveRecord::Migration
  def up
    change_column :activities, :cost, :string
  end

  def down
    change_column :activities, :cost, :integer
  end
end
