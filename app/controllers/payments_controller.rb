class PaymentsController < ApplicationController
  before_action :authenticate_user!
  def success
  end
end
