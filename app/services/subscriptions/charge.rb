# frozen_string_literal: true

require 'dry/transaction'
require 'dry/transaction/operation'

module Subscriptions
  class Charge
    include Dry::Transaction::Operation

    # Charge for subscription
    # @param subscription [Subscription]
    # @param credit_card_attributes [Hash]
    def call(subscription, credit_card_attributes)
      response = Card::PaymentGate.new.call(
        credit_card_attributes.merge(amount: subscription.price)
      )
      if response.success?
        subscription.user.update!(
          credit_card_token: response.success['token'],
          last_billed_at: Date.today
        )
        Success(subscription)
      else
        Failure(response.failure)
      end
    end
  end
end
