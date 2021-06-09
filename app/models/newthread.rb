class Newthread < ApplicationRecord
  has_many :posts
  
  validates :title, presence: true
  validates :name, presence: true
  validates :over_view, presence: true
end
