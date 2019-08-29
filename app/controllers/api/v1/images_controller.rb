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
      @request = {
        urls: ["https://img.lemde.fr/2016/12/01/0/0/2250/1500/688/0/60/0/d0530c1_7640-1p0efxb.4ogsnhfr.JPG", "https://media.mnn.com/assets/images/2019/08/baby_jumping_spider.jpg", "https://img.lemde.fr/2019/03/19/0/0/4237/2825/688/0/60/0/df70090_v9Bvi2-hWy02C-JQRW1xHs6J.jpg", "https://test.JPG"],
        keywords: ["spider", "dog"]
      }
    # TEST #
  end

  def set_response
    @responses = []

    @request[:urls].each do |url|
      @image = Image.find_by("'#{url}' = ANY (urls)")

      if @image.present?
        alert?
      else
        # Appeler IA
        @alert = "sorry buddy"
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

# params => [{ tag: 'p', id: 'toto', content: 'lorem ispum' }, { ... }]
# output => [{ id: 'toto', alert: true }, { ... }]
