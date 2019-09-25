# frozen_string_literal: true

require 'dry/transaction'
require 'dry/transaction/operation'

module Subscriptions
  class Save
    include Dry::Transaction::Operation

    # @param subscription [Subscription]
    def call(subscription)
      if subscription.save
        Success(subscription)
      else
        Failure(subscription.errors)
      end
    end
  end
end
