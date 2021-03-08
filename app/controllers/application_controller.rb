class ApplicationController < ActionController::Base
  def index
    binding.pry
    @searchs = Post.search(params[:search])
  end
end
