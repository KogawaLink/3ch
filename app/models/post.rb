class Post < ApplicationRecord
 belongs_to :newthread
 mount_uploader :image, ImageUploader
 
 validates :postname, presence: true
 validates :comment, presence: true
end