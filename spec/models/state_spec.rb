require 'rails_helper'

RSpec.describe State do
  let(:state) { create(:state) }

  it 'has a federal parent' do
    expect(state.federal).to be_a(Federal)
  end

  it 'has counties' do
    expect(state.counties).to be_a(ActiveRecord::Associations::CollectionProxy)
  end

  it 'has cities' do
    expect(state.cities).to be_a(ActiveRecord::Associations::CollectionProxy)
  end
end
