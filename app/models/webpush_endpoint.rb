class WebpushEndpoint < ApplicationRecord
  validates :auth_key, uniqueness: true

  def web_push(message) # rubocop:disable Metrics/MethodLength
    Webpush
      .payload_send(
        message: message,
        endpoint: endpoint,
        p256dh: p256dh_key,
        auth: auth_key,
        vapid: {
          private_key: Rails.application.credentials.dig(:web_push, :private_key),
          public_key: Rails.application.credentials.dig(:web_push, :public_key),
        },
      )
  rescue Webpush::ExpiredSubscription => _e
    delete # mark as inactive
  end
end
