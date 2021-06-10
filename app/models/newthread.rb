class Newthread < ApplicationRecord
  has_many :posts
  
  validates :title, presence: true
  validates :name, presence: true
  
  scope :search, -> (word) {where(['title LIKE ?', "%#{word}%"])}
end
