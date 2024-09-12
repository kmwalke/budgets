module ApplicationHelper
  def currency(number)
    number_to_currency number, precision: 0
  end

  def percentage(part, total)
    number_to_percentage((part / total * 100), precision: 0, format: '%n')
  end
end
