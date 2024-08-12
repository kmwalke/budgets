require 'rails_helper'

RSpec.describe 'County' do
  let!(:county) { create(:county) }

  it 'shows the county budget', skip: 'not implemented' do
    visit county_path(county)
    expect(true).to be_nil
  end

  it 'lists the cities' do
    city = create(:city, county:)
    visit county_path(county)
    expect(page).to have_content(city.name)
  end

  it 'links to a city page' do
    city = create(:city, county:)
    visit county_path(county)
    click_on city.name
    expect(page).to have_current_path(city_path(city))
  end
end
