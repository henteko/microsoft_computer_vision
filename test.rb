require 'net/http'
require 'json'

# See: https://dev.projectoxford.ai/docs/services/56f91f2d778daf23d8ec6739/operations/56f91f2e778daf14a499e1fa

SUBSCRIPTION_KEY = ENV['SUBSCRIPTION_KEY']

uri = URI('https://api.projectoxford.ai/vision/v1.0/analyze')
uri.query = URI.encode_www_form(
    {
        'visualFeatures' => 'Description',
        # 'details' => '{string}'
    }
)

request = Net::HTTP::Post.new(uri.request_uri)
request['Content-Type'] = 'application/json'
request['Ocp-Apim-Subscription-Key'] = SUBSCRIPTION_KEY
request.body = {
    url: 'https://i.ytimg.com/vi/lJdfoNIxYV0/maxresdefault.jpg'
}.to_json

response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
  http.request(request)
end

puts response.body
