require 'rails_helper'

RSpec.describe 'State' do
  before :all do
    @state = create(:state)
    3.times do
      budget = create(:budget, department: create(:department, municipality: @state))
      10.times do
        create(:line_item, budget:)
      end
    end
  end

  before :each do
    visit state_path(@state)
  end

  it 'shows the latest state budget' do
    expect(page).to have_content(@state.departments.first.latest_budget.year)
  end

  it 'shows the latest state budget data' do
    expect(page).to have_content(@state.departments.first.name)
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
