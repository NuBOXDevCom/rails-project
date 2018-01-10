class AddBirthdayAndHeightAndGenderToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :birthday, :date
    add_column :users, :height, :integer
    add_column :users, :gender, :string, length: 1
  end
end
