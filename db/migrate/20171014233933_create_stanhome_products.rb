class CreateStanhomeProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :stanhome_products do |t|
      t.integer :reference, null: false
      t.string :product_name, null: false
      t.integer :quantity, null: false
      t.timestamps
    end
  end
end
