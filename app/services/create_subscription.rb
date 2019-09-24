require 'dry/transaction'
require 'dry/container'

class Container
  extend Dry::Container::Mixin

  namespace 'subscriptions' do
    register 'charge_card' do
      Card::Charge.new
    end

    register 'save' do
      Subscriptions::Save.new
    end

    register 'save_shipping_information' do
      Subscriptions::SaveShippingInformation.new
    end

    register 'validate' do
      Subscriptions::Validate.new
    end

    register 'set_billing_day' do
      Subscriptions::SetBillingDay.new
    end
  end
end

class CreateSubscription
  include Dry::Transaction(container: ::Container)

  step :validate, with: 'subscriptions.validate'
  step :set_billing_day, with: 'subscriptions.set_billing_day'
  step :charge_card, with: 'subscriptions.charge_card'
  step :save, with: 'subscriptions.save'
  step :save_shipping_information, with: 'subscriptions.save_shipping_information'
end
