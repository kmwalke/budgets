require 'rails_helper'

RSpec.describe City do
  let(:city) { create(:city) }

  it 'has a county parent' do
    expect(city.county).to be_a(County)
  end
end
