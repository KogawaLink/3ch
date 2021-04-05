class PostsController < ApplicationController
 
 def index
  @newthread = Newthread.find(params[:id])
  @post = @newthread.posts.new
 end
 
 def create
  @newthread = Newthread.find(params[:newthread_id])
  @post = @newthread.posts.new(post_params)
  
  if @post.save
   redirect_to posts_path(@newthread)
  else
   render "newthreads/new"
  end
 end

 private

 def post_params
  params.require(:post).permit(:postname, :comment)
 end
end
