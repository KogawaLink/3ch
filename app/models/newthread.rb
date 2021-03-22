class Newthread < ApplicationRecord
  def posts
  end
  validates :title, presence: true
  validates :over_view, presence: true
  validates :name, presence: true
end
