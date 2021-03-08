class ApplicationController < ActionController::Base
  def index
    @searchs = Search.search(params[:search])
  end
end
