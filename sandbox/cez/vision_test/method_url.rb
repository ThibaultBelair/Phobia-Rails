require "awesome_print"
require "google/cloud/vision"



# image_path = "https://dwj199mwkel52.cloudfront.net/assets/core/banners/home-bg-6cf169a0c16b22e40d41358cd3e09aac5d87ccbc8290ea4ad517261188d34dc9.jpg"



# url = "https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Palystes_superciliosus_female_ventral_annotation_numbers.JPG/306px-Palystes_superciliosus_female_ventral_annotation_numbers.JPG"

# url = image_path

# image_path = url




 # image_path = "https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Palystes_superciliosus_female_ventral_annotation_numbers.JPG/306px-Palystes_superciliosus_female_ventral_annotation_numbers.JPG"

class VisionClient

  def self.url_detection(image_path)
    image_annotator = Google::Cloud::Vision::ImageAnnotator.new

    response = image_annotator.web_detection(
      image:       image_path,
      max_results: 2 # optional, defaults to 10
    )

    response.responses.each do |res|
      # res.web_detection.web_entities.each do |entity|
      #   # puts entity.description
      # end

      res.web_detection.full_matching_images.each do |match|
        puts match.url
      end
    end
  end

end

# url_detection(url)

# ar = []
# ar << url_detection(url)
# ap ar





