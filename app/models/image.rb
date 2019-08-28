class Image < ApplicationRecord
  def self.from(url)
    @images = Image.all
    @images.each do |image|
      Image.find(image.id).urls.include?(url)
    end
  end

  def self.verify(keyword)
    @images.each do |image|
      Image.find(image.id).keywords.include?(keyword)
    end
  end
end
