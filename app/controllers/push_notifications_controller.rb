class PushNotificationsController < ApplicationController
  def create
    Webpush.payload_send webpush_params

    head :ok
  end

  private

  def webpush_params
    subscription_params = fetch_subscription
    message = "Hello world, the time is #{Time.zone.now}"
    endpoint = subscription_params[:endpoint],
    p256dh = subscription_params.dig(:keys, :p256dh)
    auth = subscription_params.dig(:keys, :auth)
    api_key = "1001375988604" || ""

    { message: message, endpoint: endpoint, p256dh: p256dh, auth: auth, api_key: api_key }
  end

  def fetch_subscription
    encoded_subscription = session.fetch(:subscription) do
      raise "Cannot create notification: no :subscription in params or session"
    end

    JSON.parse(Base64.urlsafe_decode64(encoded_subscription)).with_indifferent_access
  end
end
