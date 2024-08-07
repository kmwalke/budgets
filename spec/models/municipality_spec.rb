require 'rails_helper'

RSpec.describe Municipality do
  let(:municipality) { create(:municipality) }

  it 'requires a name' do
    expect { create(:municipality, name: '') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'requires a type' do
    expect { create(:municipality, muni_type: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'requires a status' do
    expect { create(:municipality, muni_status: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
