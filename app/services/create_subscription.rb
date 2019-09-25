# frozen_string_literal: true

require 'dry/transaction'

class CreateSubscription
  include Dry::Transaction(container: ::Container)

  step :validate, with: 'subscriptions.validate'
  step :set_billing_day, with: 'subscriptions.set_billing_day'
  step :charge_card, with: 'subscriptions.charge_card'
  step :save, with: 'subscriptions.save'
  step :save_shipping_information, with: 'subscriptions.save_shipping_information'
end
