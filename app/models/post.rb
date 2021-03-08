class Post < ApplicationRecord
 def self.search(search)
  if search
   Post.where(['title LIKE ?', "%#{search}%"])
  else
   Post.all
  end
 end
end
