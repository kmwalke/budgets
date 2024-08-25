class CitiesController < ApplicationController
  def show
    @city                = City.find(params[:id])
    @ordered_departments = ordered_departments(@city)
  end
end
