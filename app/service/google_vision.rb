require "google/cloud/vision"

class GoogleVision

  def self.url_detection(image_path)
    image_annotator = Google::Cloud::Vision::ImageAnnotator.new

    response = image_annotator.web_detection(
      image:       image_path,
      max_results: 20 # optional, defaults to 10
    )

    image_urls = []

    response.responses.each do |res|
      # res.web_detection.web_entities.each do |entity|
      #   puts entity.description
      # end

      res.web_detection.full_matching_images.each do |match|
        # puts match.url
        image_urls << match.url
      end
    end

    return image_urls

  end


  def self.label_detection(image_path)

    image_annotator = Google::Cloud::Vision::ImageAnnotator.new

      response = image_annotator.label_detection(
        image:       image_path,
        max_results: 5 # optional, defaults to 10
      )

      image_labels = []

      response.responses.each do |res|
        res.label_annotations.each do |label|
         image_labels << label.description
        end
      end

    return image_labels

  end

end



