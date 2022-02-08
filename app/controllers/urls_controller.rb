class UrlsController < ApplicationController
  before_action :set_url, only: %i[show redirect]

  # GET /urls
  def index
    @urls = Url.all
  end

  # GET /urls/1
  def show
  end

  # GET /urls/new
  def new
    @url = Url.new
  end

  def redirect # rubocop:disable Metrics/MethodLength
    @url.stats.create!(
      request: request.headers.to_h.slice(
        'REMOTE_ADDR',
        'SERVER_NAME',
        'HTTP_ACCEPT_LANGUAGE',
        'HTTP_USER_AGENT',
      ).to_json,
    )
    WebpushEndpoint.all.map do |webpush_endpoint|
      webpush_endpoint.web_push(
        {
          title: 'visited',
          body: "hits #{@url.stats.count}, url: #{@url.long}",
        }.to_json,
      )
    end
    redirect_to @url.long, status: :moved_permanently
  end

  # POST /urls
  def create
    @url = Url.new(url_params)

    if @url.save
      redirect_to @url, notice: 'Url was successfully created.'
    else
      render :new
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_url
    @url = Url.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def url_params
    params.require(:url).permit(:long)
  end
end
