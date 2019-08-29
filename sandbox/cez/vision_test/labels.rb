# image_path = "Google Cloud Storage URI, eg. 'gs://my-bucket/image.png'"

require 'awesome_print'
require "google/cloud/vision"


# def vision
# url = "https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Palystes_superciliosus_female_ventral_annotation_numbers.JPG/306px-Palystes_superciliosus_female_ventral_annotation_numbers.JPG"

  image_path = "https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Palystes_superciliosus_female_ventral_annotation_numbers.JPG/306px-Palystes_superciliosus_female_ventral_annotation_numbers.JPG"


  image_annotator = Google::Cloud::Vision::ImageAnnotator.new

  response = image_annotator.label_detection(
    image:       image_path,
    max_results: 5 # optional, defaults to 10
  )

  response.responses.each do |res|
    res.label_annotations.each do |label|
       puts label.description
    end
  end
# end


