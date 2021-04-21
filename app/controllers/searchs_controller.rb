class SearchsController < ApplicationController
  def search
    @searchs = Search.search(params[:keyword])
  end
end
