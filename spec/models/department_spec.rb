require 'rails_helper'

RSpec.describe Department do
  let!(:department) { create(:department) }

  it 'requires a name' do
    expect { create(:department, name: '') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'has budgets' do
    expect(department.budgets).to be_a(ActiveRecord::Associations::CollectionProxy)
  end

  it 'has a municipality' do
    expect(department.municipality).to be_a(Municipality)
  end
end
