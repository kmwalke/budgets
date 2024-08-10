require 'rails_helper'

RSpec.describe County do
  let(:county) { create(:county) }

  it 'has a state parent' do
    expect(county.state).to be_a(State)
  end

  it 'has cities' do
    expect(county.cities).to be_a(ActiveRecord::Associations::CollectionProxy)
  end
end
