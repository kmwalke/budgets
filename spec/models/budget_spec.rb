require 'rails_helper'

RSpec.describe Budget do
  let!(:budget) { create(:budget) }

  it 'requires a year' do
    expect { create(:budget, year: '') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'has line items' do
    expect(budget.line_items).to be_a(ActiveRecord::Associations::CollectionProxy)
  end

  it 'requires a status' do
    expect { create(:budget, status: nil) }.to raise_error(ActiveRecord::NotNullViolation)
  end

  it 'requires a valid status' do
    expect { create(:budget, status: 'invalid status') }.to raise_error(ActiveRecord::InvalidForeignKey)
  end

  it 'has a department' do
    expect(budget.department).to be_a(Department)
  end

  it 'calculates total budget' do
    li1 = create(:line_item, budget:)
    li2 = create(:line_item, budget:)
    li3 = create(:line_item, budget:)
    li4 = create(:line_item, budget:)

    expect(budget.amount).to eq(li1.amount + li2.amount + li3.amount + li4.amount)
  end
end
