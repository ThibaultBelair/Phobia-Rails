require 'json'
require 'open-uri'

class Api::V1::ImagesController < Api::V1::BaseController

  def index
    # dom = '#'
    # image_serialized = open(dom).read
    # images = JSON.parse(image_serialized)

    images = [
      {
        url: "https://img.lemde.fr/2016/12/01/0/0/2250/1500/688/0/60/0/d0530c1_7640-1p0efxb.4ogsnhfr.JPG",
        keyword: "spider"
      },
      {
        url: "https://test.jpg",
        keyword: "spider"
      },{
        url: "https://img.lemde.fr/2016/12/01/0/0/2250/1500/688/0/60/0/d0530c1_7640-1p0efxb.4ogsnhfr.JPG",
        keyword: "snake"
      }
    ]

    @responses = []

    images.each do |img|
      url = Image.from(img[:url])
      keyword = Image.verify(img[:keyword])
      # if url == false
        # APPELER API
      if url == true && keyword == false
        @alert = false
      elsif url == true && keyword == true
        @alert = true
      end
      @responses << { url: img[:url].to_s, alert: @alert.to_s }
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
