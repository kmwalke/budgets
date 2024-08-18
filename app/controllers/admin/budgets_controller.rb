module Admin
  class BudgetsController < ApplicationController
    before_action :set_budget, only: [:edit, :update, :destroy]

    def new
      @budget = Budget.new
    end

    def edit; end

    def create
      @budget = Budget.new(budget_params)

      respond_to do |format|
        if @budget.save
          format.html { redirect_to admin_budgets_path, notice: 'Budget was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    def update
      respond_to do |format|
        if @budget.update(budget_params)
          format.html { redirect_to admin_budgets_path, notice: 'Budget was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @budget.destroy
      respond_to do |format|
        format.html { redirect_to admin_budgets_path, notice: 'Budget was successfully destroyed.' }
      end
    end

    private

    def set_budget
      @budget = Budget.find(params[:id])
    end

    def budget_params
      params.require(:budget).permit(:year, :csv)
    end
  end
end
