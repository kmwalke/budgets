module Admin
  class MunicipalitiesController < ApplicationController
    before_action :set_municipality, only: [:edit, :update]

    def edit; end

    def update
      respond_to do |format|
        if @municipality.csv.attach(municipality_params[:csv])
          format.html { redirect_to root_path, notice: 'Municipality was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    private

    def set_municipality
      @municipality = Municipality.find(params[:id])
    end

    def municipality_params
      params.require(:municipality).permit(:csv)
    end
  end
end
