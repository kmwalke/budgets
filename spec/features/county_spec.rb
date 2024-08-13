require 'rails_helper'

RSpec.describe 'County' do
  
  before :all do
    @county = create(:county)
    3.times do
      budget = create(:budget, department: create(:department, municipality: @county))
      10.times do
        create(:line_item, budget:)
      end
    end
  end

  before :each do
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
end
