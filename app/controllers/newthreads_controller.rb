class NewthreadsController < ApplicationController
  
  def index
    @newthreads = Newthread.all
  end
  
  def new
    @newthread = Newthread.new
  end
  
  def create
    @post = Post.new
    @post.comment = params[:newthread][:over_view]
    if !@post.valid?  #<% バリデーションを実施（空欄禁止）%>
      flash.now[:danger] = "入力していない欄があります。"
      render :new and return
    end
    @newthread = Newthread.new(newthread_params)
    @newthread.ip_address = request.remote_ip  #<% ipアドレスを取得し保存 %>
    if @newthread.save
      @post = @newthread.posts.new  #<% Newthreadが作成されたと同時に最初のpostを作成保存 %>
      @post.postname = @newthread.name
      @post.ip_address = @newthread.ip_address
      @post.comment = params[:newthread][:over_view]
      if @post.save
        redirect_to posts_path(@newthread), success:"新たなスレッドが生まれました。" and return  #<% エラーが起きるため and return にて解消 %>
      else
        render :new
      end
    else
      flash.now[:danger] = "入力していない欄があります。"
      render :new
    end
  end
  
  def delete
    @thread = Newthread.find(params[:id])
    @post = Post.where(newthread_id: @thread)  #<% threadのidと紐づいているPostのコメントのidを取得　%>
  end
  
  def destroy
    @thread = Newthread.find_by(id: params[:id])
    if  @thread.pw.eql?(params[:newthread][:again_password]) && @thread.posts.destroy_all && @thread.destroy!
      redirect_to root_path, success: '削除しました。'
    else
      flash[:danger] = 'パスワードが違います'
      redirect_to newthread_delete_path(@thread)
    end
  end
  
  def search  #<% 検索機能 %>
    @threads = Newthread.search(params[:keyword])
  end
  
  private
  def newthread_params
    params.require(:newthread).permit(:title, :name, :pw, :ip_address)
  end
end