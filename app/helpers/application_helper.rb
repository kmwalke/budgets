module ApplicationHelper
  def currency(number)
    number_to_currency number, precision: 0
  end
end
