require 'rails_helper'

RSpec.describe 'Budget' do
  before do
    @state  = create(:state)
    @budget = create(:budget, department: create(:department, municipality: @state))
    create_list(:line_item, 10, budget: @budget)
    visit state_path(@state)
  end

  describe 'logged out' do
    it 'does not show draft budget' do
      expect(true).to be_nil
    end

    it 'shows live budget' do
      expect(true).to be_nil
    end
  end

  describe 'logged in' do
    it 'creates a budget' do
      expect(true).to be_nil
    end

    it 'shows draft budgets' do
      expect(true).to be_nil
    end

    it 'triggers an import on attaching a csv' do
      expect(true).to be_nil
    end
  end
end
