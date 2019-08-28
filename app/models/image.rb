class Image < ApplicationRecord
  def self.from(url)
    images = Image.all
    images.map do |image|
      image.urls.include?(url)
    end
  end

  def self.verify(keyword)
    images = Image.all
    images.map do |image|
      image.keywords.include?(keyword)
    end
  end
end
