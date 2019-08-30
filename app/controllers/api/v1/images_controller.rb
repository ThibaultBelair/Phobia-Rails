require 'json'
require 'open-uri'

class Api::V1::ImagesController < Api::V1::BaseController
  def index
    parse_request
    set_response
  end

  private

  def parse_request
    # OFFICIAL PARSE
      # dom = '#'
      # request_serialized = open(dom).read
      # @request = JSON.parse(request_serialized)
    # OFFICIAL PARSE

    # TEST #
      @request = {
        urls: ["http://ketenewplymouth.peoplesnetworknz.info/image_files/0000/0011/2768/1_Vagrant_spider__Uliodon_spp__13_mm_body-004.JPG", # Should return "Error HTTP", is not a https://
          "https://img.20mn.fr/-CIjLecFT8KuwFCgY-lh1Q/310x190_serpent-illustration.jpg", # Should return false, is a snake
          "https://cdnph.upi.com/ph/st/th/6391508355313/2017/i/15083591785642/v1.5/After-sex-female-jumping-spiders-get-shy.jpg?lg=5" # Should return true, is a spider
        ],
        keywords: [
          "Spider",
          "Dog"
        ]
      }
    # TEST #
  end

  def set_response
    @responses = []

    @request[:urls].each do |url|
      @url = url
      if /^https?:/.match?(@url)
        valid_url
      else
        @alert = "Error HTTP"
      end
      @responses << { src: @url, alert: @alert }
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
    if (@image.keywords & @request[:keywords]).empty?
      @alert = false
    else
      @alert = true
    end
  end
end
