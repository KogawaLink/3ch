class TopsController < ApplicationController
  def index
    @thread = Post.limit(5).order("created_at desc")
  end
end
