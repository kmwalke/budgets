class CountiesController < ApplicationController
  def show
    @county = County.find(params[:id])
  end
end
