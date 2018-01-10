class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :nb_persons
      t.integer :preparation_time
      t.integer :cooking_time
      t.text :ingredients
      t.text :preparation
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
