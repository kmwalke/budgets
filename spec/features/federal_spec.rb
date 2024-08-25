require 'rails_helper'

RSpec.describe 'Federal' do
  before do
    @federal = Federal.first
    budget   = create(:budget, department: create(:department, municipality: @federal))
    create_list(:line_item, 10, budget:)
    visit root_path
  end

  it 'shows the latest federal budget' do
    expect(page).to have_content(@federal.departments.first.latest_budget.year)
  end

  it 'shows the latest federal budget data' do
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

  it 'links to a department' do
    dept = create(:department, municipality: @federal)
    create(:line_item, budget: create(:budget, department: dept))

    visit root_path
    click_on dept.name
    expect(page).to have_current_path(department_path(dept))
  end
end
