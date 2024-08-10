require 'rails_helper'

RSpec.describe State do
  let(:state) { create(:state) }
  let(:county) { create(:county, state:) }
  let(:city) { create(:city, county:) }

  it 'has a federal parent' do
    expect(state.federal).to be_a(Federal)
  end

  it 'has counties' do
    expect(state.counties).to be_a(ActiveRecord::Associations::CollectionProxy)
  end

  it 'has cities' do
    expect(state.cities).to be_a(ActiveRecord::Relation)
  end

  it 'returns its own cities' do
    expect(state.cities.find_by(id: city.id)).to eq(city)
  end

  it 'does not return other cities' do
    expect(state.cities.find_by(id: create(:city).id)).to eq(nil)
  end
end
