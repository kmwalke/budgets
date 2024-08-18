require 'rails_helper'

RSpec.describe 'Budget' do
  before do
    @state  = create(:state)
    visit state_path(@state)
  end

  describe 'logged out' do
    it 'does not show draft budget' do
      budget = create_budget
      visit state_path(@state)

      expect(page).to have_no_content(budget.year)
    end

    it 'shows live budget' do
      budget = create_budget(status: MuniStatus::LIVE)
      visit state_path(@state)

      expect(page).to have_content(budget.year)
    end
  end

  describe 'logged in' do
    before do
      login_as_user
      visit state_path(@state)
    end

    it 'creates a budget' do
      click_on 'New Budget'
      fill_in 'Year', with: 2024
      click_on 'Create Budget'

      expect(page).to have_current_path(state_path(@state))
    end

    it 'activates a budget' do
      budget = create_budget(status: MuniStatus::DRAFT)
      visit state_path(@state)

      click_on 'Activate Budget'

      expect(budget.reload.status).to eq(MuniStatus::LIVE)
    end

    it 'shows draft budgets' do
      budget = create_budget
      visit state_path(@state)

      expect(page).to have_content(budget.year)
    end

    it 'triggers an import on attaching a csv', skip: 'not implemented' do
      budget = create_budget
      budget.csv.attach('csv')
      expect(true).to be_nil
    end
  end
end

def create_budget(status: MuniStatus::DRAFT)
  budget = create(:budget, department: create(:department, municipality: @state), status:)
  create_list(:line_item, 10, budget:)

  budget
end
