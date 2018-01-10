class Post < ApplicationRecord

  include ImageUploader::Attachment.new(:image)

  validates :name, presence: true
  validates :content, presence: true

end
