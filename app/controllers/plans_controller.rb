# frozen_string_literal: true

class PlansController < ApplicationController
  # GET /plans
  def index
    @plans = Plan.all

    render json: @plans
  end
end
