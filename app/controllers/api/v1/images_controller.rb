require 'json'
require 'open-uri'

class Api::V1::ImagesController < Api::V1::BaseController
  def index
    parse_request
    set_response
  end

  private

  def parse_request
    # dom = '#'
    # request_serialized = open(dom).read
    # @request = JSON.parse(request_serialized)

    # TEST #
      # @request = {
      #   urls: ["https://upload.wikimedia.org/wikipedia/commons/8/8f/Latrodectus_hasseltii_close.jpg", "https://test.jpg"],
      #   keywords: ["Spider", "Dog"]
      # }
    # TEST #
  end

  def set_response
    @responses = []

    @request[:urls].each do |url|
      @image = Image.find_by("'#{url}' = ANY (urls)")
      ap @image
      if @image.present?
        alert?
      else
        @image = Image.create_from_google(url)
        alert?
      end

      @responses << { src: url, alert: @alert }
    end
  end

  def alert?
    if (@image.keywords & @request[:keywords]).empty?
      @alert = false
    else
      @alert = true
    end
  end
end
