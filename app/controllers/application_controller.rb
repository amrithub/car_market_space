class ApplicationController < ActionController::Base
    # sign in if not already done in order to buy a car
      def after_sign_in_path_for(payment)
        stored_location_for(payment) || cars_path
      end
end
