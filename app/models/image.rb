class Image < ApplicationRecord
  def self.from(url)
    @images = Image.all
    @images.each do |image|
      Image.find(image.id).urls.include?(url)
    end
  end
end
