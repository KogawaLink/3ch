class ApplicationController < ActionController::Base
  before_action :search, :load_onesignal_appid
  def search
    @searchs = Newthread.search(params[:search])
  end
  
  protect_from_forgery with: :exception
  
  add_flash_types :success, :info, :warning, :danger
  
  def load_onesignal_appid
    gon.onesignal_appid = ENV['ONESIGNAL_APPID']
  end
 
end