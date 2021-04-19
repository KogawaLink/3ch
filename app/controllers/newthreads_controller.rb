class NewthreadsController < ApplicationController
  
  def index
    @newthreads = Newthread.all
  end
  
  def new
    @newthread = Newthread.new
  end
  
  def create
    @newthread = Newthread.new(newthread_params)
    if @newthread.save
     redirect_to posts_path(@newthread), success:"新たなスレッドが生まれました。"
    else
     flash.now[:alert] = "失敗"
     render :new
    end
  end
  
  def delete
    @thread = Newthread.find(params[:id])
    newthreads_path(@thread)
  end
  
  def destroy
    if @thread && Newthread.find(params[:pw])
      @thread.destroy
      redirect_to root_path, success: '削除しました。'
    else
      flash.now[:danger] = 'パスワードが違います'
      render :delete
    end
  end
  
  
  private
  def newthread_params
    params.require(:newthread).permit(:title, :over_view, :name, :pw)
  end
end