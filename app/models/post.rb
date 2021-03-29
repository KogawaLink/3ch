class Post < ApplicationRecord
 def new
  @post = Post.new
 end
 
 def create
  @post = Post.new
  @post.save
  redirect_to posts_path(@post)
 end
end