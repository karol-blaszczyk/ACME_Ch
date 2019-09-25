# frozen_string_literal: true

require 'dry/transaction'

class SubscriptionCharge
  include Dry::Transaction(container: ::Container)

  step :charge_card, with: 'subscriptions.charge_card'
end
