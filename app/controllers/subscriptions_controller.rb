class SubscriptionsController < ApplicationController

  def create
    Rails.logger.info "oloa"
    Rails.logger.info JSON.dump(params.fetch(:subscription).permit(:endpoint, keys: [:p256dh, :auth]).to_h)
    session[:subscription] = JSON.dump(params.fetch(:subscription).permit(:endpoint, keys: [:p256dh, :auth]).to_h)

    head :ok
  end

end
