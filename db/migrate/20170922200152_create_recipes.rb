class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :serves
      t.string :category
      t.string :ingredients
      t.string :directions

      t.timestamps
    end
  end
end
