require 'json'
require 'open-uri'

class Api::V1::ImagesController < Api::V1::BaseController

  def index
    dom = '#'
    image_serialized = open(dom).read
    images = JSON.parse(image_serialized)

    images.each do |img|
      url = Image.from(img[:url])
      keyword = Image.verify(img[:keyword])
      if url == false
        # APPELER API
      elsif url == true && keyword == false
        @alert = false
      elsif url == true && keyword == true
        @alert = true
      else
        "ERROR"
      end
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
