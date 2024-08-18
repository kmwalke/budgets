require 'rails_helper'

RSpec.describe Municipality do
  let(:municipality) { create(:municipality) }

  it 'requires a name' do
    expect { create(:municipality, name: '') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'requires a type' do
    expect { create(:municipality, type: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'requires a valid type' do
    expect { create(:municipality, type: 'invalid type') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'requires a status' do
    expect { create(:municipality, status: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'requires a valid status' do
    expect { create(:municipality, status: 'invalid status') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'defaults status to draft' do
    expect(described_class.create(name: 'a', type: MuniType::STATE).status).to eq(MuniStatus::DRAFT)
  end

  it 'has departments' do
    expect(municipality.departments).to be_a(ActiveRecord::Associations::CollectionProxy)
  end
end
