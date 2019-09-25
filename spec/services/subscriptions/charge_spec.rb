# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Subscriptions::Charge, type: :service do
  subject(:subscription_charge) { described_class.new }

  let(:user) { create(:user) }
  let(:subscription) { create(:subscription, user: user) }
  let(:payment_gate) { instance_double('Card::PaymentGate') }

  before do
    allow(Card::PaymentGate).to receive(:new).and_return(payment_gate)
    allow(payment_gate).to receive(:call).and_return(response)
  end

  context 'when success' do
    let(:response) do
      double(success?: true, success: { 'token' => '1234' })
    end

    it 'updates user last_billed_at and credit_card_token' do
      expect { subscription_charge.call(subscription, {}) }.to change(user, :credit_card_token)
        .and change(user, :last_billed_at).from(nil).to(Date.today)
        .and change(user, :credit_card_token).from(nil).to(response.success['token'])
    end

    it 'returns success response' do 
      expect(subscription_charge.call(subscription, {}).success?).to be(true)
    end
  end

  context 'when failure' do
    let(:response) do
      double(success?: false, failure: ['failure message'])
    end

    it 'returns response failure' do
      expect(subscription_charge.call(subscription, {}).success?).to be(false)
    end
  end
end
