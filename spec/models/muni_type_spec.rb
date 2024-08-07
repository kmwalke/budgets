require 'rails_helper'

RSpec.describe MuniType do
  let!(:muni_type) { create(:muni_type) }

  it 'requires a name' do
    expect { create(:muni_type, name: '') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'requires a unique name' do
    expect { create(:muni_type, name: muni_type.name) }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
