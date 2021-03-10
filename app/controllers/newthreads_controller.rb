class NewthreadsController < ApplicationController
  def index
    @newthread = Newthread.new
  end
  
  def create
    Newthread.create
  end
end
