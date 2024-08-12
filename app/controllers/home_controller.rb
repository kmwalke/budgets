class HomeController < ApplicationController
  def index
    @federal = Federal.first
  end
end
