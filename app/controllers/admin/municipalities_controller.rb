module Admin
  class MunicipalitiesController < ApplicationController
    before_action :set_municipality, :logged_in

    def edit; end

    def update
      respond_to do |format|
        if @municipality.csv.attach(municipality_params[:csv])
          format.html { redirect_to @muni_path, notice: 'Municipality was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    def activate
      respond_to do |format|
        if @municipality.update(status: MuniStatus::LIVE)
          format.html { redirect_to @muni_path, notice: 'Municipality is now LIVE.' }
        else
          format.html { render :show }
        end
      end
    end

    private

    def set_municipality
      @municipality = Municipality.find(params[:id])
      @muni_path    = path_for @municipality
    end

    def municipality_params
      params.permit(:municipality).permit(:csv)
    end

    def path_for(municipality)
      "/#{municipality.type.pluralize.downcase}/#{municipality.id}"
    end
  end
end
