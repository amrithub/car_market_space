class PaymentsController < ApplicationController
  before_action :authenticate_user!
  def success
  end
  def webhook
    p params
  end
end
