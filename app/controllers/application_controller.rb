class ApplicationController < ActionController::Base
  before_action :search
  def search
    @searchs = Post.search(params[:search])
  end
end