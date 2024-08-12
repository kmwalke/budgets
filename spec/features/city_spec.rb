require 'rails_helper'

RSpec.describe 'City' do
  let!(:city) { create(:city) }

  it 'shows the city budget', skip: 'not implemented' do
    visit city_path(city)
    expect(true).to be_nil
  end
end
