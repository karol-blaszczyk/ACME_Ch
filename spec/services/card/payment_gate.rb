# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Card::PaymentGate, type: :service do
  subject(:card_charge) { described_class.new }

  let(:subscription) { create(:subscription) }

  context 'with valid card' do
    subject(:new_card) { '' }

    let(:attributes) do
      {}
    end

    context 'when Success' do
    end

    context 'when Failure' do
      context 'valid fakepay response' do
      end

      context 'invalid fakepay response' do
      end
    end
  end
end
