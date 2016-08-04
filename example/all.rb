require 'microsoft_computer_vision'
require 'json'

subscription_key = ENV['SUBSCRIPTION_KEY']
@client = MicrosoftComputerVision::Client.new(subscription_key)
IMAGE_URL = 'https://www.pakutaso.com/shared/img/thumb/PAK105215431_TP_V.jpg'
IMAGE_FILE_PATH = File.expand_path('../test.jpg', __FILE__)

# See: https://dev.projectoxford.ai/docs/services/56f91f2d778daf23d8ec6739/operations/56f91f2e778daf14a499e1fa
def analyze
  puts 'Analyze'

  options = {
      visual_features: 'Faces', # [Categories, Tags, Description, Faces, ImageType, Color, Adult]
      details: 'Celebrities' # [Celebrities]
  }

  # image url
  res = @client.analyze(IMAGE_URL, options)
  puts res.body

  # image file
  res = @client.analyze(IMAGE_FILE_PATH, options)
  puts res.body
end

# See: https://dev.projectoxford.ai/docs/services/56f91f2d778daf23d8ec6739/operations/56f91f2e778daf14a499e1fe
def describe
  puts 'Describe'

  options = {
      max_candidates: '1'
  }

  # image url
  res = @client.describe(IMAGE_URL, options)
  puts res.body

  # image file
  res = @client.describe(IMAGE_FILE_PATH, options)
  puts res.body
end

# See: https://dev.projectoxford.ai/docs/services/56f91f2d778daf23d8ec6739/operations/56f91f2e778daf14a499e1fb
def thumbnail
  puts 'Thumbnail'

  options = {
      width: 400,
      height: 400,
      smart_cropping: true
  }

  # image url
  res = @client.thumbnail(IMAGE_URL, options)
  out = File.expand_path('../thumbnail_from_image_url.jpg', __FILE__)
  File.write out, res.body
  puts "Created #{out}"

  # image file
  out = File.expand_path('../thumbnail_from_image_file.jpg', __FILE__)

  res = @client.thumbnail(IMAGE_FILE_PATH, options)
  File.write out, res.body
  puts "Created #{out}"
end

# See: https://dev.projectoxford.ai/docs/services/56f91f2d778daf23d8ec6739/operations/56f91f2e778daf14a499e1fd
def domain_models
  puts 'Domain Models'

  res = @client.domain_models
  puts res.body
end

# See: https://dev.projectoxford.ai/docs/services/56f91f2d778daf23d8ec6739/operations/56f91f2e778daf14a499e1fc
def ocr
  puts 'OCR'

  options = {
      language: 'ja',
      detect_orientation: true
  }

  # image url
  res = @client.ocr(IMAGE_URL, options)
  puts res.body

  # image file
  res = @client.ocr(IMAGE_FILE_PATH, options)
  puts res.body
end

# See: https://dev.projectoxford.ai/docs/services/56f91f2d778daf23d8ec6739/operations/56f91f2e778daf14a499e200
def domain_model
  puts 'DomainModel'

  res = @client.domain_models
  models = JSON.parse(res.body)['models']

  model = models[0]['name']
  puts "model: #{model}"
  options = {
      model: model
  }

  # image url
  res = @client.domain_model(IMAGE_URL, options)
  puts res.body

  # image file
  res = @client.domain_model(IMAGE_FILE_PATH, options)
  puts res.body
end

# See: https://dev.projectoxford.ai/docs/services/56f91f2d778daf23d8ec6739/operations/56f91f2e778daf14a499e1ff
def tag
  puts 'Tag'

  # image url
  res = @client.tag(IMAGE_URL)
  puts res.body

  # image file
  res = @client.tag(IMAGE_FILE_PATH)
  puts res.body
end

analyze
describe
thumbnail
domain_models
ocr
domain_model
tag
