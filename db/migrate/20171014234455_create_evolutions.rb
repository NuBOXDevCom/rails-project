class CreateEvolutions < ActiveRecord::Migration[5.1]
  def change
    create_table :evolutions do |t|
      t.references :user, foreign_key: true, null: false
      t.integer :week_number, null: false
      t.integer :year, null: false
      t.decimal :size_neck, precision: 10, scale: 2, null: false
      t.decimal :size_chest, precision: 10, scale: 2, null: false
      t.decimal :size_west, precision: 10, scale: 2, null: false
      t.decimal :size_hips, precision: 10, scale: 2, null: false
      t.decimal :size_arms, precision: 10, scale: 2, null: false
      t.decimal :size_legs, precision: 10, scale: 2, null: false
      t.decimal :size_calves, precision: 10, scale: 2, null: false
      t.decimal :weight, precision: 10, scale: 2, null: false
    end
  end
end
