class AddContinentToDestinations < ActiveRecord::Migration
  def change
    add_column :destinations, :continent, :string
  end
end
