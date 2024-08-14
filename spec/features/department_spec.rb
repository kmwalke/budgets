require 'rails_helper'

RSpec.describe 'Department' do
  before do
    @state = create(:state)
    budget = create(:budget, department: create(:department, municipality: @state))
    create_list(:line_item, 10, budget:)
    visit state_path(@state)
  end

  it 'shows the latest state budget' do
    expect(page).to have_content(@state.departments.first.latest_budget.year)
  end

  it 'shows the departments' do
    @state.departments.each do |department|
      expect(page).to have_content(department.name)
    end
  end

  it 'lists the counties' do
    county = create(:county, state: @state)
    visit state_path(@state)
    expect(page).to have_content(county.name)
  end

  it 'links to a county page' do
    county = create(:county, state: @state)
    visit state_path(@state)
    click_on county.name
    expect(page).to have_current_path(county_path(county))
  end

  it 'links to a city page' do
    city = create(:city, county: create(:county, state: @state))
    visit state_path(@state)
    click_on city.name
    expect(page).to have_current_path(city_path(city))
  end
end
