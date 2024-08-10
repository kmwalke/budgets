require 'rails_helper'

RSpec.describe State do
  let(:state) { create(:state) }

  it 'has a federal parent' do
    expect(state.federal).to be_a(Federal)
  end

  it 'has counties' do
    expect(state.counties.first).to be_a(County)
  end

  it 'has cities' do
    expect(state.cities.first).to be_a(City)
  end
end
