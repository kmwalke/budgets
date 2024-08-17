require 'rails_helper'

RSpec.describe 'Session' do
  before do
    login_as_user
  end

  it 'logs in' do
    expect(page).to have_content('Signed in successfully.')
  end

  it 'logs out' do
    click_on 'Sign out'
    expect(page).to have_content('Signed out successfully.')
  end
end
