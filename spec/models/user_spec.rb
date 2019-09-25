# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:subscriptions).dependent(:destroy) }

  it 'serialized does not include credit_card_token' do
    expect(create(:user).as_json).not_to include(:credit_card_token)
  end
end
