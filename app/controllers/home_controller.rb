class HomeController < ApplicationController
  def index
    @links_count = Link.count
  end
end
