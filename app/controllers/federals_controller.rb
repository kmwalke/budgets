class FederalsController < ApplicationController
  def show
    @federal             = Federal.first
    @ordered_departments = ordered_departments(@federal)
  end
end
