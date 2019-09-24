# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateSubscription, type: :service do
  subject(:create_subscription) { described_class.new }

  let(:user) { create(:user) }
  let(:plan) { create(:plan) }

  let(:subscription_params) do
    {
      'customer_attributes' => { 'first_name' => 'string',
                                 'last_name' => 'string',
                                 'adress' => 'string',
                                 'zip_code' => 'string' },
      'credit_card_attributes' => { 'card_number' => '4242424242424242',
                                    'cvv' => '123',
                                    'expiration_month' => '01',
                                    'expiration_year' => '2024',
                                    'zip_code' => '10045' },
      'plan_id' => plan.id
    }
  end

  it 'works' do
    subscription = user.subscriptions.new(plan: plan, price: plan.price)

    create_subscription = CreateSubscription.new.with_step_args(
      save_shipping_information: [{ 'first_name' => 'string',
                                    'last_name' => 'string',
                                    'adress' => 'string',
                                    'zip_code' => 'string' }],
      charge_card: [{ 'card_number' => '4242424242424242',
                      'cvv' => '123',
                      'expiration_month' => '01',
                      'expiration_year' => '2024',
                      'zip_code' => '10045' }]
    )

    expect do
      create_subscription.call subscription
    end.to change {
      [user.last_billed_at, user.subscriptions.count]
    }.from([nil, 0]).to([Date.today, 1])
  end
end
