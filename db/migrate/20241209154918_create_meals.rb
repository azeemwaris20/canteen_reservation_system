class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 8, scale: 2
      t.string :image
      t.boolean :availability

      t.timestamps
    end
  end
end
