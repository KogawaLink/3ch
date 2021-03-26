class Search < ApplicationRecord
 def self.search(search)
  if search
   Search.where(['title LIKE ?', "%#{search}%"])
  else
   Search.all
  end
 end
end
