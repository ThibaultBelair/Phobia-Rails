class Api::V1::ImagesController < Api::V1::BaseController
  def index

    image = Image.from(params[:url])
    if image == true
      "Blur this image"
    else
      "call API"
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
