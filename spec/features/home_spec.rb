require 'rails_helper'

RSpec.describe 'Home' do
  before do
    @federal = create(:federal)
    3.times do
      budget = create(:budget, department: create(:department, municipality: @federal))
      create_list(:line_item, 10, budget:)
    end
  end

  it 'shows the latest federal budget' do
    visit root_path
    expect(page).to have_content(@federal.departments.first.latest_budget.year)
  end

  it 'shows the latest federal budget data' do
    visit root_path
    expect(page).to have_content(@federal.departments.first.name)
  end

  it 'lists the states' do
    state = create(:state, federal: @federal)
    visit root_path
    expect(page).to have_content(state.name)
  end

  it 'links to a state page' do
    state = create(:state, federal: @federal)
    visit root_path
    click_on state.name
    expect(page).to have_current_path(state_path(state))
  end
end
