class PostsController < ApplicationController
 def index
  @newthread = Newthread.includes(:posts).find(params[:id])
  @newthread_posts = @newthread.posts.order("created_at desc").page(params[:page]).per(5)
  page = params[:page].nil? ? 1 : params[:page].to_i  #<%  ページが空だった場合１を代入し、空じゃない場合はページ数を数値として取得 %>
  @start = (page - 1) * 5  #<%  startを定義しページ数に対するコメント番号を計算 %>
  @postcount = @newthread.posts.count
  @post = @newthread.posts.new
 end
 
 def create
  @newthread = Newthread.find(params[:newthread_id])
  @post = @newthread.posts.new(post_params)
  @post.ip_address = request.remote_ip
  @postname = @post.postname
  if @postname.blank?
   @post.postname = "名無しさん"
  end
  if @post.save
       CreateNotification.call(
        contents: { 'en' => 'Post created!', 'ja' => 'スレッドが更新されました' },
        type: 'posts#create'
       );
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
