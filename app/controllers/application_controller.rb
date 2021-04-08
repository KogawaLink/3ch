class ApplicationController < ActionController::Base
  before_action :search
  def search
    @searchs = Search.search(params[:search])
  end
  
  
  def timestamp
   @time = Date.current.strftime('%Y年 %m月 %d日')
  end
 
end