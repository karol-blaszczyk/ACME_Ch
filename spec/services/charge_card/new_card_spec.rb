# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChargeCard::NewCard, type: :service do
  subject(:new_card_charge) { described_class.new }

  context 'with valid card' do
    subject(:new_card) { '' }

    let(:credit_card_attributes) do
      { 'card_number' => '4242424242424242',
        'cvv' => '123',
        'expiration_month' => '01',
        'expiration_year' => '2024',
        'zip_code' => '10045' }
    end

    it 'purchase correctly and return token' do
      expect(
        ChargeCard::NewCard.new.call(
          amount: '1000',
          credit_card_attributes: credit_card_attributes
        )
      )
        .to eq(nil)
    end
  end
end
