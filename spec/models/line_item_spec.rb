require 'rails_helper'

RSpec.describe LineItem do
  let!(:line_item) { create(:line_item) }

  it 'requires a name' do
    expect { create(:line_item, name: '') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'has a department' do
    expect(line_item.budget).to be_a(Budget)
  end
end
