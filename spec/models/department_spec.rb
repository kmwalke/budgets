require 'rails_helper'

RSpec.describe Department do
  let!(:department) { create(:department) }

  it 'requires a name' do
    expect { create(:department, name: '') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'has line items' do
    expect(department.line_items).to be_a(ActiveRecord::Associations::CollectionProxy)
  end

  it 'has expenses' do
    expect(department.expense).to be_a(Expense)
  end
end
