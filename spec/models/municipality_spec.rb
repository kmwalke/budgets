require 'rails_helper'

RSpec.describe Municipality do
  let(:municipality) { create(:municipality) }

  it 'requires a name' do
    expect { create(:municipality, name: '') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'requires a type' do
    expect { create(:municipality, type: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'requires a status' do
    expect { create(:municipality, status: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'defaults status to draft' do
    expect(Municipality.create(name: 'a', type: MuniType::STATE).status).to eq(MuniStatus::DRAFT)
  end

  it 'requires live municipalities to have an expense' do
    expect(true).to be_nil
  end
end
