class AddApiPasswordToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :api_password, :string
  end
end
