# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  validates_uniqueness_of :plan_id, scope: :user_id
end
