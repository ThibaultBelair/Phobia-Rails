require 'json'
require 'open-uri'

class Api::V1::ImagesController < Api::V1::BaseController
  def index
    # dom = '#'
    # request_serialized = open(dom).read
    # @request = JSON.parse(request_serialized)

    request = {
      url: ["https://img.lemde.fr/2016/12/01/0/0/2250/1500/688/0/60/0/d0530c1_7640-1p0efxb.4ogsnhfr.JPG", "https://img.lemde.fr/2019/03/19/0/0/4237/2825/688/0/60/0/df70090_v9Bvi2-hWy02C-JQRW1xHs6J.jpg", "https://test.JPG"],
      keywords: ["spider", "snake"]
    }

    @responses = []

    request[:url].each do |url|
      image = Image.where("'#{url}' = ANY (urls)")

      if image.present?
        if image.keywords & request[:keywords] != []
          @alert = true
        else
          @alert = false
        end
      else
        # Appeler IA
        @alert = "sorry buddy"
      end

      @responses << { url: url, alert: @alert }
    end
  end

  private

  def parse_request
  end

  # def set_response
  #   @responses = []
  #   @images.each do |img|
  #     @url = Image.from(img[:url])
  #     @keyword = Image.verify(img[:keyword])

  #     valid_image?

  #     @responses << { url: img[:url], alert_url: @url, alert_key: @keyword, alert: @alert }
  #   end
  # end

  # def valid_image?
  #   if @url.include?(true)
  #     alert?
  #   else
  #     # appeler IA
  #     # alert?
  #     @alert = "sorry buddy"
  #   end
  # end

  # def alert?
  #   if @url == @keyword
  #     @alert = true
  #   else
  #     @alert = false
  #   end
  # end
end

# params => [{ tag: 'p', id: 'toto', content: 'lorem ispum' }, { ... }]
# output => [{ id: 'toto', alert: true }, { ... }]
