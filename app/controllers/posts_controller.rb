class PostsController < ApplicationController
 
 def index
 end
 
 def create
  @newthread = Newthread.find(params[:id])
  @post = Post.new(params_post)
  @post.newthread = @post
  
  if @comment.save
   redirect_to posts_path(@post)
  else
   render "newthreads/new"
  end
 end

 private

 def post_params
  params.require(:post).permit(:names, :comment)
 end
end
