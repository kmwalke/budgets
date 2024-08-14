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

  it 'gets latest budget' do
    latest_budget = create(:budget, year: 2024, department:)
    create(:budget, year: 2023, department:)
    create(:budget, year: 2022, department:)
    create(:budget, year: 2021, department:)

    expect(department.latest_budget).to eq(latest_budget)
  end

  it 'gets amount' do
    create(:budget, department:)

    expect(department.amount).to eq department.latest_budget.amount
  end
end
