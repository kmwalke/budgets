require 'rails_helper'

RSpec.describe MuniStatus do
  let!(:muni_status) { create(:muni_status) }

  it 'requires a name' do
    expect { create(:muni_status, name: '') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'requires a unique name' do
    expect { create(:muni_status, name: muni_status.name) }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
