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
      visit edit_admin_municipality_path(@state)
      expect(page).to have_current_path(root_path)
    end

    it 'does not link to new budget' do
      expect(page).to have_no_content('Upload Budget CSV')
    end
  end

  describe 'logged in' do
    before do
      login_as_user
      visit state_path(@state)
    end

    it 'redirects after editing a budget' do
      visit edit_admin_municipality_path(@state)

      click_on 'Update Budget'

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
  @state.update(status:)
  budget = create(:budget, year: 2024, department: create(:department, municipality: @state), status:)
  create_list(:line_item, 10, budget:)

  budget
end
