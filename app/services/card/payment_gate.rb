# frozen_string_literal: true

require 'dry/monads'

module Card
  class PaymentGate
    include Dry::Monads[:result, :do]

    # endpoint simulates the authorization, tokenization, and charging of a credit card
    FAKEPAY_CONNECTION = Faraday.new(
      url: 'https://www.fakepay.io',
      headers: { 'Content-Type' => 'application/json' }
    ) do |conn|
      conn.request :url_encoded
      conn.adapter Faraday.default_adapter
      conn.authorization :Token, token: '6bc7446dbd7e42cd969fa9ba007352'
    end

    # @param attributes [Hash] credit card details hash or hash with token
    def call(attributes)
      response = FAKEPAY_CONNECTION.post('/purchase', attributes.to_json)

      if response.success?
        Success(JSON.parse(response.body))
      else
        Failure(message: 'Purchase failed', error_code: JSON.parse(response.body).dig('error_code'))
      end
    end
  end
end
