require 'uri'

class UrlsController < ApplicationController

  # GET /urls
  def index
    @urls = Url.all

    render json: @urls
  end

  # POST /urls
  def create
    parsed = URI.parse(url)
    unless parsed.kind_of?(URI::HTTP)
      render status: :bad_request, json: {valid: false}
    else
      parsed_s = parsed.to_s
      ParseUrlContentJob.perform_now(parsed_s) # TODO for simplicity. can be done with perform_later and any installed job queue
      render json: {url: parsed_s, valid: true}
    end

  end

  private
    # Only allow a trusted parameter "white list" through.
    def url
      params.require(:url)
    end
end
