require 'rails_helper'

RSpec.describe Budget do
  let!(:budget) { create(:budget) }

  it 'requires a year' do
    expect { create(:budget, year: '') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'has line items' do
    expect(budget.line_items).to be_a(ActiveRecord::Associations::CollectionProxy)
  end

  it 'has a department' do
    expect(budget.department).to be_a(Department)
  end

  it 'calculates total budget' do
    expect(true).to be_nil
  end
end
