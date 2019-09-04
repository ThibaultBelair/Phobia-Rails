class Image < ApplicationRecord
  def self.create_from_google(url)
    urls = GoogleVision.url_detection(url)
    keywords = GoogleVision.label_detection(url)
    urls << url
    if keywords.present?
      Image.create(urls: urls, keywords: keywords)
    else
      nil
    end
  end
end
