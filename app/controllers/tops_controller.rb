class TopsController < ApplicationController
  def index
    @thread = Newthread.limit(5).order("created_at desc")
  end
  
  def search
    @searchs = Search.search(params[:search])
  end
end
