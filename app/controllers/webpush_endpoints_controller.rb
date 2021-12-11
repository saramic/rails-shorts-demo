class WebpushEndpointsController < ApplicationController

  def create
    webpush_endpoint = WebpushEndpoint
      .find_or_initialize_by(
        auth_key: webpush_endpoint_params[:keys][:auth],
      )
    webpush_endpoint.update(
        endpoint: webpush_endpoint_params[:endpoint],
        p256dh_key: webpush_endpoint_params[:keys][:p256dh],
      )
    if webpush_endpoint.save
      render json: webpush_endpoint.attributes.slice("endpoint")
    else
      render json: webpush_endpoint.errors.full_messages
    end
  end

  private

  def webpush_endpoint_params
    params.permit(:endpoint, keys: [:auth, :p256dh])
  end
end
