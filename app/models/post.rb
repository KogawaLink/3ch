class Post < ApplicationRecord
 belongs_to :newthread
 
 validates :postname, presence: true
 validates :comment, presence: true
end