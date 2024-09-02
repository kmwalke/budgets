require 'rails_helper'

RSpec.describe LineItem do
  let!(:line_item) { create(:line_item) }

  it 'requires a name' do
    expect { create(:line_item, name: '') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'requires a amount' do
    expect { create(:line_item, amount: '') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'has a budget' do
    expect(line_item.budget).to be_a(Budget)
  end

  it 'handles large amounts' do
    expect(line_item.update(amount: 17_000_000_000_000)).to be(true)
  end
end
