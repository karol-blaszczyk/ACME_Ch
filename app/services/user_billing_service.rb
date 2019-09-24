# frozen_string_literal: true

class UserBillingService
  # Raised when billing date is invalid
  class InvalidBillingDate < StandardError; end

  def initialize(user)
    @user = user
  end

  # Set billing day for user
  # We bill monthly, from the date of the customer's signup
  # Billing dates range from 1-28
  def set_user_billing_day!
    @user.update!(billing_day: [@user.created_at.day, 28].min)
  end

  # @param plan [Plan]
  def renew_subscription(subscription)
    PurchaseService.new.purchase(subscription)
  end
end
