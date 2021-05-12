class PostsController < ApplicationController
 
 def index
  @newthread = Newthread.includes(:posts).find(params[:id])
  @post = @newthread.posts.new
 end
 
 def create
  @newthread = Newthread.find(params[:newthread_id])
  @post = @newthread.posts.new(post_params)
  @post.ip_address = request.remote_ip
  if @post.save
       CreateNotification.call(
        contents: { 'en' => 'Post created!', 'ja' => 'スレッドが更新されました' },
        type: 'posts#create'
       )
    respond_to do |format|
     format.js
    end
     redirect_to posts_path(@newthread)
  else
     render "newthreads/new"
  end
 end

 private

 def post_params
  params.require(:post).permit(:postname, :comment, :image)
 end
end
