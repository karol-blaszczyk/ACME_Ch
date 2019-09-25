# frozen_string_literal: true

require 'dry/transaction'
require 'dry/transaction/operation'

module Subscriptions
  class SaveShippingInformation
    include Dry::Transaction::Operation

    # We save subscription customer shipping information on user record
    # @param subscription [Subscription]
    def call(subscription, customer_shipping_information)
      subscription.user.update(
        billing_first_name: customer_shipping_information['first_name'],
        billing_last_name: customer_shipping_information['last_name'],
        billing_adress: customer_shipping_information['adress'],
        billing_zip_code: customer_shipping_information['zip_code']
      )
      Success(subscription)
    end
  end
end
