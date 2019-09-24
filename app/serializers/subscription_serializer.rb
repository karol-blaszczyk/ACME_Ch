class SubscriptionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :price

  belongs_to :plan
  belongs_to :user
end
