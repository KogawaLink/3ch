class Post < ApplicationRecord
 belongs_to :newthread
 mount_uploader :image, ImageUploader
 
 @noname = "名無しさん"
 validates :comment, presence: true
end