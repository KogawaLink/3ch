class Newthread < ApplicationRecord
  def posts
  end
  has_many :posts
  
  validates :title, presence: true
  validates :over_view, presence: true
  validates :name, presence: true
end
