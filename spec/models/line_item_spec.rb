require 'rails_helper'

RSpec.describe LineItem do
  let!(:line_item) { create(:line_item) }

  it 'requires a name' do
    expect { create(:line_item, name: '') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'has a department' do
    expect(line_item.department).to be_a(Department)
  end

  it 'has an expense' do
    expect(line_item.expense).to be_a(Expense)
  end
end
