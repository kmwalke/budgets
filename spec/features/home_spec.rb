require 'rails_helper'

RSpec.describe 'Home' do
  let!(:state) { create(:state) }

  before :each do
    visit root_path
  end
  it 'displays the homepage' do
    expect(page).to have_content('tax dollars')
  end

  xit 'shows the federal budget' do
    expect(true).to be_nil
  end

  it 'lists the states' do
    expect(page).to have_content(state.name)
  end

  it 'links to a state page' do
    click_link state.name
    expect(page).to have_current_path(state), ignore_query: true
  end
end
