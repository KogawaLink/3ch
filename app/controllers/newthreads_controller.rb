class NewthreadsController < ApplicationController
  
  def index
    @newthreads = Newthread.all
  end
  
  def new
    @newthread = Newthread.new
  end
  
  def create
    @newthread = Newthread.new(newthread_params)
    @newthread.ip_address = request.remote_ip
    if @newthread.save
      redirect_to posts_path(@newthread), success:"新たなスレッドが生まれました。"
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
  
  private
  def newthread_params
    params.require(:newthread).permit(:title, :over_view, :name, :pw, :ip_address)
  end
end