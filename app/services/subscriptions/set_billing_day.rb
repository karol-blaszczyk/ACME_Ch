# frozen_string_literal: true

require 'dry/transaction'
require 'dry/transaction/operation'

module Subscriptions
  class SetBillingDay
    include Dry::Transaction::Operation

    # Set billing day for subscription
    # We bill monthly, from the date of the customer's signup
    # Billing dates range from 1-28
    # @param subscription [Subscription, Array<String>]
    # @return [Success[Subscription], Failure[Array<String>]]
    def call(subscription)
      billing_day = [subscription.user.created_at.day, 28].min
      user = subscription.user
      if subscription.user.update(billing_day: billing_day)
        Success(subscription)
      else
        Failure(user.errors)
      end
    end
  end
end
