require 'rails_helper'

RSpec.describe 'Budget' do
  before do
    @state  = create(:state)
    visit state_path(@state)
  end

  let!(:draft_budget) { create_budget }

  describe 'logged out' do
    it 'does not show draft budget' do
      visit state_path(@state)

      expect(page).to have_no_content(draft_budget.year)
    end

    it 'shows live budget' do
      budget = create_budget(status: MuniStatus::LIVE)
      visit state_path(@state)

      expect(page).to have_content(budget.year)
    end

    it 'requires logging in to create a budget' do
      visit new_budget_path
      expect(page).to have_current_path(root_path)
    end

    it 'does not link to new budget' do
      expect(page).to have_no_content('New Budget')
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

    it 'edits a budget' do
      visit state_path(@state)

      fill_in 'Year', with: 1066
      click_on 'Update Budget'

      expect(draft_budget.reload.year).to eq(1066)
    end

    it 'redirects after editing a budget' do
      visit edit_budget_path(draft_budget)

      click_on 'Update Budget'

      expect(page).to have_current_path(state_path(@state))
    end

    it 'deletes a budget' do
      budget_id = draft_budget.id
      visit state_path(@state)

      click_on draft_budget.year.to_s
      click_on 'Delete Budget'

      expect(Budget.find(budget_id)).to be_nil
    end

    it 'redirects after deleteing a budget' do
      visit edit_budget_path(draft_budget)

      click_on 'Delete Budget'

      expect(page).to have_current_path(state_path(@state))
    end

    it 'activates a budget' do
      visit state_path(@state)

      click_on 'Activate Budget'

      expect(draft_budget.reload.status).to eq(MuniStatus::LIVE)
    end

    it 'redirects after activating a budget' do
      visit state_path(@state)

      click_on 'Activate Budget'

      expect(page).to have_current_path(state_path(@state))
    end

    it 'shows draft budgets' do
      visit state_path(@state)

      expect(page).to have_content(draft_budget.year)
    end

    it 'triggers an import on attaching a csv', skip: 'not implemented' do
      draft_budget.csv.attach('csv')
      expect(true).to be_nil
    end
  end
end

def create_budget(status: MuniStatus::DRAFT)
  budget = create(:budget, year: 2024, department: create(:department, municipality: @state), status:)
  create_list(:line_item, 10, budget:)

  budget
end
