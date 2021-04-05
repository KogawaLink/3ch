class Post < ApplicationRecord
 belongs_to :newthread
 def new
  @post = Post.new
 end
 
 def create
  @post = Post.new
  @post.save
  redirect_to posts_path(@post)
 end
 
 validates :names, presence: true
 validates :comments, presence: true
end