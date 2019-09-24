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
      save_shipping_information: [{ 'first_name' => 'first_name',
                                    'last_name' => 'last_name',
                                    'adress' => 'adress',
                                    'zip_code' => 'zip_code' }],
      charge_card: [{ 'card_number' => '4242424242424242',
                      'cvv' => '123',
                      'expiration_month' => '01',
                      'expiration_year' => '2024',
                      'zip_code' => '10045' }]
    )

    expect { create_subscription.call subscription }.to
    change { user.subscriptions.count }.by(1)
      .and change(user, :last_billed_at).from(nil).to(Date.today)
      .and change(user, :credit_card_token)
      .and change(user, :billing_first_name).from(nil).to('first_name')
      .and change(user, :billing_last_name).from(nil).to('last_name')
      .and change(user, :billing_adress).from(nil).to('adress')
      .and change(user, :billing_zip_code).from(nil).to('zip_code')
  end
end
