# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Subscription, type: :model do
  subject { create(:subscription) }

  it { should belong_to(:user) }
  it { should belong_to(:plan) }
  it { should validate_uniqueness_of(:plan_id).scoped_to(:user_id) }
end
