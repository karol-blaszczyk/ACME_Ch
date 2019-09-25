require 'dry/container'

class Container
  extend Dry::Container::Mixin

  namespace 'subscriptions' do
    register 'charge_card' do
      Subscriptions::Charge.new
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
