class StatesController < ApplicationController
  def show
    @state               = State.find(params[:id])
    @ordered_departments = ordered_departments(@state)
  end
end
