class PlanSerializer
  include FastJsonapi::ObjectSerializer
  attributes :price, :name
end
