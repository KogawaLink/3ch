class NewthreadsController < ApplicationController
  def index
    @newthread = Newthread.new
  end
  
  def create
    @newthread = Newthread.new(newthread_params)
    @newthread.save
    redirect_to tops_posts_path
  end
  
  private
  def newthread_params
    params.permit(:title, :over_view, :name, :pw)
  end
end