require 'json'
require 'open-uri'

class Api::V1::ImagesController < Api::V1::BaseController
  def create
    response = set_response
    render json: response
  end

  private

  def set_response
    params[:images].map do |img|
      @url = img[:url]

      if @url.end_with?('svg')
        @alert = false
      elsif /^https:/.match?(@url)
        valid_url
      else
        @alert = true
      end

      { id: img[:id], alert: @alert }
    end
  end

  def valid_url
    @image = Image.find_by("'#{@url}' = ANY (urls)")

    if @image.present?
      alert?
    else
      @image = Image.create_from_google(@url)
      alert?
    end
  end

  def alert?
    if (@image.keywords.map(&:downcase) & params[:phobias].map(&:downcase)).empty?
      @alert = false
    else
      @alert = true
    end
  end
end
