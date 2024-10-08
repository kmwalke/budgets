require 'rails_helper'

RSpec.describe 'County' do
  before do
    @county = create(:county)
    budget  = create(:budget, department: create(:department, municipality: @county))
    create_list(:line_item, 10, budget:)
    visit county_path(@county)
  end

  it 'shows the latest county budget' do
    expect(page).to have_content(@county.departments.first.latest_budget.year)
  end

  it 'shows the latest county budget data' do
    expect(page).to have_content(@county.departments.first.name)
  end

  it 'lists the cities' do
    city = create(:city, county: @county)
    visit county_path(@county)
    expect(page).to have_content(city.name)
  end

  it 'links to a city page' do
    city = create(:city, county: @county)
    visit county_path(@county)
    click_on city.name
    expect(page).to have_current_path(city_path(city))
  end

  it 'links to a department' do
    dept = create(:department, municipality: @county)
    create(:line_item, budget: create(:budget, department: dept))

    visit county_path(@county)
    click_on dept.name
    expect(page).to have_current_path(department_path(dept))
  end
end
