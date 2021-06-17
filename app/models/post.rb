class Post < ApplicationRecord
 belongs_to :newthread, optional: true
 mount_uploader :image, ImageUploader
 

 validates :comment, presence: true
end