require 'json'
require 'open-uri'

class Api::V1::ImagesController < Api::V1::BaseController

  def index
    # dom = '#'
    # image_serialized = open(dom).read
    # images = JSON.parse(image_serialized)

    images = [
      {
        url: "https://img.lemde.fr/2017/08/03/0/0/3198/2976/688/0/60/0/7e8a69c_14438-jpx6uv.jpv00vbo6r.jpg",
        keyword: "spider"
      },
      {
        url: "https://img.lemde.fr/2019/03/19/0/0/4237/2825/688/0/60/0/df70090_v9Bvi2-hWy02C-JQRW1xHs6J.jpg",
        keyword: "spider"
      },
      {
        url: "https://img.lemde.fr/2017/08/03/0/0/3198/2976/688/0/60/0/7e8a69c_14438-jpx6uv.jpv00vbo6r.jpg",
        keyword: "snake"
      },
      {
        url: "https://img.lemde.fr/2019/03/19/0/0/4237/2825/688/0/60/0/df70090_v9Bvi2-hWy02C-JQRW1xHs6J.jpg",
        keyword: "snake"
      },
      {
        url: "https://test.jpg",
        keyword: "snake"
      }
    ]

    @responses = []

    images.each do |img|
      url = Image.from(img[:url])
      keyword = Image.verify(img[:keyword])

      if url.include?(true)
        if url == keyword
          @alert = true
        else
          @alert = false
        end
      else
        #appeler API
        @alert = "sorry buddy"
      end

      @responses << { url: img[:url], alert_url: url, alert_key: keyword, alert: @alert }
    end
  end

  def new
  end

  def create
  end

  def update
  end
end

# params => [{ tag: 'p', id: 'toto', content: 'lorem ispum' }, { ... }]
# output => [{ id: 'toto', alert: true }, { ... }]
