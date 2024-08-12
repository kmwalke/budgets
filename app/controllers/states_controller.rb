class StatesController < ApplicationController
  def show
    @state = State.find(params[:id])
  end
end
