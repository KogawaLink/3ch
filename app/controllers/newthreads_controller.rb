class NewthreadsController < ApplicationController
  def index
    @newthread = Newthread.new
  end
  
  def create
    Newthread.create
    @newthread = Newthread.new(params.newthread)
    @newthread.save
    redirect_to "/posts"
  end
  
  def new
  end
  
end
