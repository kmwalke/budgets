require 'rails_helper'

RSpec.describe BudgetImporter do
  it 'has nil handling' do
    expect(BudgetImporter.import(nil)).to be_nil
  end
end
