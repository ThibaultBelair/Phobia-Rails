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
        puts "img not valid"
      elsif /^https:/.match?(@url)
        valid_url
      else
        @alert = true
        puts "img not valid"
      end

      finished = Time.now

      { id: img[:id], alert: @alert }
    end
  end

  def valid_url
    @image = Image.find_by("'#{@url}' = ANY (urls)")

    if @image.present?
      puts "image present"
      alert?
    else
      puts "asking vision for #{@url}"
      @image = Image.create_from_google(@url)
      alert?
    end
  end

  def alert?
    if @image && @image.match_phobia?(params[:phobias])
      @alert = false
    else
      @alert = true
    end
  end
end
