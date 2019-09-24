# frozen_string_literal: true

class Plan < ApplicationRecord
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user
end
