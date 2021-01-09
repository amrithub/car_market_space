class PaymentsController < ApplicationController
  # before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:webhook] 
  #payment successful
  def success
  end
  # Webhook method definition
  def webhook
    payment_id= params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    listing_id = payment.metadata.listing_id
    user_id = payment.metadata.user_id

    p "car id " + car_id
    p "user id " + user_id

    status 200
end
end
