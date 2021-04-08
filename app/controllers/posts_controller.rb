class PostsController < ApplicationController
 
 def index
  @newthread = Newthread.includes(:posts).find(params[:id])
  @post = @newthread.posts.new
  @time = Date.current.strftime('%Y年 %m月 %d日')
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
