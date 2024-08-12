require 'rails_helper'

RSpec.describe 'State' do
  let!(:state) { create(:state) }

  before :all do
    create(:city, county: create(:county, state:))
  end

  before :each do
    visit state_path(state)
  end

  xit 'shows the federal budget' do
    expect(true).to be_nil
  end

  it 'lists the states' do
    expect(page).to have_content(state.name)
  end

  it 'links to a county page' do
    click_link county.name
    expect(page).to have_current_path(county), ignore_query: true
  end

  it 'links to a city page' do
    click_link city.name
    expect(page).to have_current_path(city), ignore_query: true
  end
end
