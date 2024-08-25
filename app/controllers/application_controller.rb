class ApplicationController < ActionController::Base
  around_action :catch_errors

  def logged_in
    redirect_to root_path unless user_signed_in?
  end

  def ordered_departments(municipality)
    Department.find_by_sql(ordered_departments_sql(municipality.id))
  end

  private

  def catch_errors(&)
    Rails.error.record(&)
  end

  def ordered_departments_sql(municipality_id)
    "
    select distinct
    departments.name,
    departments.id,
    budgets.id as budget_id,
    budgets.year as year,
      (
        select sum(amount) as amount
        from line_items
        where budget_id = budgets.id
      )

    from departments
    join budgets on budgets.department_id = departments.id
    join line_items on line_items.budget_id = budgets.id
    where departments.municipality_id = #{municipality_id}
    order by amount desc
    "
  end
end
