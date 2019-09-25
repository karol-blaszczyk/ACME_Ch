# frozen_string_literal: true

class PlansController < ApplicationController
  # GET /plans
  def index
    render json: PlanSerializer.new(Plan.all)
  end
end
