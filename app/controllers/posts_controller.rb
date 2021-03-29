class PostsController < ApplicationController
 def index
  @post = Post.new
  @newthread = Newthread.find(params[:id])
 end
end
