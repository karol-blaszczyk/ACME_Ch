# frozen_string_literal: true

class PlanSerializer
  include FastJsonapi::ObjectSerializer
  attributes :price, :name
end
