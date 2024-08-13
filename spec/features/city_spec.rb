require 'rails_helper'

RSpec.describe 'City' do

  before :all do
    @city = create(:city)
    3.times do
      budget = create(:budget, department: create(:department, municipality: @city))
      10.times do
        create(:line_item, budget:)
      end
    end
  end

  before :each do
    visit city_path(@city)
  end

  it 'shows the latest city budget' do
    expect(page).to have_content(@city.departments.first.latest_budget.year)
  end

  it 'shows the latest city budget data' do
    expect(page).to have_content(@city.departments.first.name)
  end

  it 'does not show draft budgets', skip: 'not implemented' do
    expect(true).to be_nil
  end

  it 'shows old budgets', skip: 'not implemented' do
    expect(true).to be_nil
  end
end
