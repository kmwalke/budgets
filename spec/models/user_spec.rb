require 'rails_helper'

RSpec.describe User do
  it 'requires a email' do
    expect { create(:user, email: '') }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
