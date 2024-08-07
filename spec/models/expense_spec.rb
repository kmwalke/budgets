require 'rails_helper'

RSpec.describe Expense do
  let!(:expense) { create(:expense) }

  it 'requires a year' do
    expect { create(:expense, year: '') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'requires an amount' do
    expect { create(:expense, amount: '') }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
