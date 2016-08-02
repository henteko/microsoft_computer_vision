require 'net/http'
require 'json'

module MicrosoftComputerVision
  class Client
    def initialize(subscription_key)
      @subscription_key = subscription_key
    end

    def analyze(image_url, options)
      visual_features = options[:visual_features]
      details = options[:details]

      uri = URI('https://api.projectoxford.ai/vision/v1.0/analyze')
      data = {}
      data['visualFeatures'] = visual_features if visual_features
      data['details'] = details if details
      uri.query = URI.encode_www_form(data)

      request = Net::HTTP::Post.new(uri.request_uri)
      request['Content-Type'] = 'application/json'
      request['Ocp-Apim-Subscription-Key'] = @subscription_key
      request.body = {
          url: image_url
      }.to_json

      Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
      end
    end
  end
end
