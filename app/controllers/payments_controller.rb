class PaymentsController < ApplicationController
  # before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:webhook]
  def success
  end
  def webhook
    p params
  end
end
