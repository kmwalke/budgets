require 'rails_helper'

RSpec.describe 'State' do
  let!(:state) { create(:state) }

  it 'shows the state budget', skip: 'not implemented' do
    visit state_path(state)
    expect(true).to be_nil
  end

  it 'lists the counties' do
    county = create(:county, state:)
    visit state_path(state)
    expect(page).to have_content(county.name)
  end

  it 'links to a county page' do
    county = create(:county, state:)
    visit state_path(state)
    click_on county.name
    expect(page).to have_current_path(county_path(county))
  end

  it 'links to a city page' do
    city = create(:city, county: create(:county, state:))
    visit state_path(state)
    click_on city.name
    expect(page).to have_current_path(city_path(city))
  end
end
