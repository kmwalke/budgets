class CountiesController < ApplicationController
  def show
    @county              = County.find(params[:id])
    @ordered_departments = ordered_departments(@county)
  end
end
