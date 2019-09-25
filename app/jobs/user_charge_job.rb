frozen_string_literal: true

class UserChargeJob < ActiveJob::Base
  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError
  def perform(user)
    user.subscriptions.each do |subscription|
      charge_for_subscription = SubscriptionCharge.new.with_step_args(
        charge_card: [{token: user.credit_card_token}]
      ).call subscription
    end
  end
end
