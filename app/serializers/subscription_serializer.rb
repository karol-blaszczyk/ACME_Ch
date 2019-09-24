class SubscriptionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :price, :last_billed_at

  belongs_to :plan
  belongs_to :user
end
