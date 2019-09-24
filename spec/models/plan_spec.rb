# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Plan, type: :model do
  it { should have_many(:subscriptions).dependent(:destroy) }
  it do
    should have_many(:subscribers)
      .through(:subscriptions)
      .source(:user)
  end
end
