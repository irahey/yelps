class AddTubeToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :tube, :string
  end
end
