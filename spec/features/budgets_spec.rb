require 'rails_helper'

RSpec.describe 'Budget' do
  before do
    @state = create(:state)
    @budget = create(:budget, department: create(:department, municipality: @state))
    create_list(:line_item, 10, budget: @budget)
    visit state_path(@state)
  end

  describe 'logged out', skip: 'not implemented' do
    it 'does not show draft budget' do
      expect(true).to be_nil
    end

    it 'shows live budget' do
      expect(true).to be_nil
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

    it 'shows draft budgets' do
      expect(true).to be_nil
    end

    it 'triggers an import on attaching a csv', skip: 'not implemented' do
      expect(true).to be_nil
    end
  end
end
