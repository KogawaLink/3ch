class ApplicationController < ActionController::Base
  before_action :search
  def search
    @searchs = Search.search(params[:search])
  end
  
  protect_from_forgery with: :exception
  
  add_flash_types :success, :info, :warning, :danger
 
end