# frozen_string_literal: true

require 'dry/transaction'

# Charge for Subscription transaction
class SubscriptionCharge
  include Dry::Transaction(container: ::Container)

  step :charge_card, with: 'subscriptions.charge_card'
end
