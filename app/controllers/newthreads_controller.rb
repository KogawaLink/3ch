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
     redirect_to posts_posts_path(@newthread), success:"セーブ完了"
    else
     flash.now[:danger] = "失敗"
     render :new
    end
  end
  
  private
  def newthread_params
    params.require(:newthread).permit(:title, :over_view, :name, :pw)
  end
end