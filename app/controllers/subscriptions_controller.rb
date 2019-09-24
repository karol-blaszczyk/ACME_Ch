# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_subscription, only: %i[show destroy]

  # GET /subscriptions
  def index
    @subscriptions = current_user.subscriptions

    render json: @subscriptions
  end

  # GET /subscriptions/1
  def show
    render json: @subscription
  end

  # POST /subscriptions
  def create
    new_subscription = current_user.subscriptions.new(plan: plan, price: plan.price)

    create_subscription = CreateSubscription.new.with_step_args(
      save_shipping_information: [subscription_params[:customer_attributes]],
      charge_card: [subscription_params[:credit_card_attributes]]
    )

    create_subscription.call(new_subscription) do |transaction|
      transaction.success do |subscription|
        render json: subscription, status: :created
      end
      transaction.failure do |error|
        # Runs for any other failure
        render json: error, status: :unprocessable_entity
      end
    end
  end

  # DELETE /subscriptions/1
  def destroy
    @subscription.destroy
  end

  private

  def plan
    @plan = Plan.find(subscription_params[:plan_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_subscription
    @subscription = current_user.subscriptions.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def subscription_params
    params.require(:subscription).permit(
      :plan_id,
      customer_attributes: %i[
        first_name last_name adress zip_code
      ],
      credit_card_attributes: %i[
        card_number card_type expiration_month expiration_year card_holder_name zip_code cvv
      ]
    )
  end
end
