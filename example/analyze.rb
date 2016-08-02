require 'microsoft_computer_vision'

# See: https://dev.projectoxford.ai/docs/services/56f91f2d778daf23d8ec6739/operations/56f91f2e778daf14a499e1fa

subscription_key = ENV['SUBSCRIPTION_KEY']
image_url = 'https://i.ytimg.com/vi/lJdfoNIxYV0/maxresdefault.jpg'

client = MicrosoftComputerVision::Client.new(subscription_key)

options = {
    visual_features: 'Faces', # [Categories, Tags, Description, Faces, ImageType, Color, Adult]
    details: 'Celebrities' # [Celebrities]
}
res = client.analyze(image_url, options)

puts res.body
