class AddCoordinatesToFurnishing < ActiveRecord::Migration[6.0]
  def change
    add_column :furnishings, :latitude, :float
    add_column :furnishings, :longitude, :float
  end
end
