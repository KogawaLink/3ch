class TopsController < ApplicationController
  def index
    @thread = Newthread.limit(5).order("created_at desc")
  end
end
