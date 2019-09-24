# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Subscriptions::Charge, type: :service do
  subject(:subscription_charge) { described_class.new }

  let(:subscription) { create(:subscription) }
end
