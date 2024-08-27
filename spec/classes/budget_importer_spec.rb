require 'rails_helper'

RSpec.describe BudgetImporter do
  it 'has nil handling' do
    expect(described_class.import(nil)).to be_nil
  end
end
