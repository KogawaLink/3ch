class Newthread < ApplicationRecord
  has_many :posts
  belongs_to :search
  
  validates :title, presence: true
  validates :over_view, presence: true
  validates :name, presence: true
end
