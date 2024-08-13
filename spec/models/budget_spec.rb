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
    li_1 = create(:line_item, budget:)
    li_2 = create(:line_item, budget:)
    li_3 = create(:line_item, budget:)
    li_4 = create(:line_item, budget:)

    expect(budget.total_amount).to eq(li_1.amount + li_2.amount + li_3.amount + li_4.amount)
  end
end
