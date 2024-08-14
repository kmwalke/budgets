class FederalsController < ApplicationController
  def show
    @federal = Federal.first
  end
end
