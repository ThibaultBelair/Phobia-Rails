class Image < ApplicationRecord
  def self.create_from_google(url)
    urls = GoogleVision.url_detection(url)
    keywords = GoogleVision.label_detection(url)

    urls << url

    if keywords != nil
      Image.create(urls: urls, keywords: keywords)
    end
  end
end
