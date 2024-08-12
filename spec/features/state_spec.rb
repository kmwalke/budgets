require 'rails_helper'

RSpec.describe 'State' do
  let!(:state) { create(:state) }

  xit 'shows the state budget' do
    visit state_path(state)
    expect(true).to be_nil
  end

  it 'lists the counties' do
    visit state_path(state)
    expect(page).to have_content(county.name)
  end

  it 'links to a county page' do
    visit state_path(state)
    expect(page).to have_current_path(county), ignore_query: true
  end

  it 'links to a city page' do
    visit state_path(state)
    expect(page).to have_current_path(city), ignore_query: true
  end
end
