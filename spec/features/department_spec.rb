require 'rails_helper'

RSpec.describe 'Department' do
  before do
    @department = create(:department)
    budget      = create(:budget, department: @department)
    create_list(:line_item, 10, budget:)
    visit department_path(@department)
  end

  it 'shows the latest department budget' do
    expect(page).to have_content(@department.latest_budget.year)
  end

  it 'shows the line_items' do
    @department.latest_budget.line_items.each do |line_item|
      expect(page).to have_content(line_item.name)
    end
  end
end
