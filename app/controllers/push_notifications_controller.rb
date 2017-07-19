class PushNotificationsController < ApplicationController
require "base64"
 #  def create
 #   Rails.logger.info "Sending push notification from #{push_params.inspect}"
 #   subscription_params = fetch_subscription_params
 #
 #   WebpushJob.perform_later fetch_message,
 #     endpoint: subscription_params[:endpoint],
 #     p256dh: subscription_params.dig(:keys, :p256dh),
 #     auth: subscription_params.dig(:keys, :auth)
 #
 #   head :ok
 # end
 #
 # private
 #
 # def push_params
 #   params.permit(:message, { subscription: [:endpoint, keys: [:auth, :p256dh]]})
 # end
 #
 # def fetch_message
 #   push_params.fetch(:message, "Yay, you sent a push notification!")
 # end
 #
 # def fetch_subscription_params
 #   @subscription_params ||= push_params.fetch(:subscription) { extract_session_subscription }
 # end
 #
 # def extract_session_subscription
 #   subscription = session[:subscription]
 #
 #   JSON.parse(subscription).with_indifferent_access
 # end
  def create
    Webpush.payload_send webpush_params

    head :ok
  end

  private

  def webpush_params
    subscription_params = fetch_subscription
    message = "Hello world, the time is #{Time.zone.now}"
    endpoint = subscription_params["endpoint"]
    p256dh = subscription_params.dig("keys", "p256dh")
    auth = subscription_params.dig("keys", "auth")
    api_key = "AIzaSyAjrhMQ9zh_7UD4VVsxH0dg_Tb3HXl-VoA"

    { message: message, endpoint: endpoint, p256dh: p256dh, auth: auth, api_key: api_key }
  end



  def fetch_subscription
    encoded_subscription = session.fetch(:subscription) do
      raise "Cannot create notification: no :subscription in params or session"
    end

    JSON.parse(encoded_subscription)
  end
end
