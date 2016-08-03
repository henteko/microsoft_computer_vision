require 'microsoft_computer_vision'

# See: https://dev.projectoxford.ai/docs/services/56f91f2d778daf23d8ec6739/operations/56f91f2e778daf14a499e1fa

subscription_key = ENV['SUBSCRIPTION_KEY']
client = MicrosoftComputerVision::Client.new(subscription_key)
options = {
    visual_features: 'Faces', # [Categories, Tags, Description, Faces, ImageType, Color, Adult]
    details: 'Celebrities' # [Celebrities]
}

# image url
image_url = 'https://www.pakutaso.com/shared/img/thumb/PAK105215431_TP_V.jpg'
res = client.analyze_image_url(image_url, options)
puts res.body

# image file
File.open(File.expand_path('../../test_files/test.jpg', __FILE__)) do |image_file|
  res = client.analyze_image_file(image_file.read, options)
  puts res.body
end
