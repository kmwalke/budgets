require 'rails_helper'

RSpec.describe 'City' do
  before do
    @city  = create(:city)
    budget = create(:budget, department: create(:department, municipality: @city))
    create_list(:line_item, 10, budget:)
    visit city_path(@city)
  end

  it 'shows the latest city budget' do
    expect(page).to have_content(@city.departments.first.latest_budget.year)
  end

  it 'shows the latest city budget data' do
    expect(page).to have_content(@city.departments.first.name)
  end

  it 'links to a department' do
    dept = create(:department, municipality: @city)
    create(:line_item, budget: create(:budget, department: dept))

    visit city_path(@city)
    click_on dept.name
    expect(page).to have_current_path(department_path(dept))
  end
end
