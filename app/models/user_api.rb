class UserApi < ApplicationRecord
  self.table_name = 'users'

  has_secure_password

  has_many :posts
  has_many :evolutions
  validates_presence_of :email, :password

end
