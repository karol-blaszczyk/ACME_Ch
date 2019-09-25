# frozen_string_literal: true

class UserChargeJob < ActiveJob::Base
  # Charge user for his Subscriptions
  # @param user [User]
  def perform(user)
    user.subscriptions.each do |subscription|
      charge_for_subscription = SubscriptionCharge.new.with_step_args(
        charge_card: [{token: user.credit_card_token}]
      ).call subscription
    end
  end
end
