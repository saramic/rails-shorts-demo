class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :edit, :redirect, :update, :destroy]

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


  def redirect
    @url.stats.create!(
      request: request.headers.to_h.slice(
        "REMOTE_ADDR",
        "SERVER_NAME",
        "HTTP_ACCEPT_LANGUAGE",
        "HTTP_USER_AGENT",
      ).to_json
    )
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
