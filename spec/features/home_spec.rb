require 'rails_helper'

RSpec.describe 'Home' do
  let!(:state) { create(:state) }

  before do
    visit root_path
  end

  it 'displays the homepage' do
    expect(page).to have_content('tax dollars')
  end

  it 'shows the federal budget', skip: 'not implemented' do
    expect(true).to be_nil
  end

  it 'lists the states' do
    expect(page).to have_content(state.name)
  end

  it 'links to a state page' do
    click_on state.name
    expect(page).to have_current_path(state_path(state))
  end
end
