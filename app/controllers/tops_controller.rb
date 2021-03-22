class TopsController < ApplicationController
  def index
  end
  
  def posts
    @newthread = Newthread.find(params[:id])
  end
  
  def newthread
  end
end
