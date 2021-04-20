class Search < ApplicationRecord
 has_many :newthread
 def self.search(search)
  if search
   Newthread.where(['title LIKE ?', "%#{search}%"])
  else
   Newthread.all
  end
 end
end
