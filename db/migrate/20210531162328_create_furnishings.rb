class CreateFurnishings < ActiveRecord::Migration[6.0]
  def change
    create_table :furnishings do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :location
      t.string :furnishing_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
