class ApplicationController < ActionController::Base
  before_action :search
  def search
    @searchs = Search.search(params[:search])
  end
end