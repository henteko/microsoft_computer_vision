require 'net/http'
require 'json'

module MicrosoftComputerVision
  class Client

    API_BASE = 'https://api.projectoxford.ai/vision/v1.0'

    def initialize(subscription_key)
      @subscription_key = subscription_key
    end

    def analyze_image_url(image_url, options)
      analyze = Api::Analyze.new(options[:visual_features], options[:details])
      request_image_url(analyze.uri, image_url)
    end

    def analyze_image_file(image_file, options)
      analyze = Api::Analyze.new(options[:visual_features], options[:details])
      request_image_file(analyze.uri, image_file)
    end

    private

    def request_image_file(uri, image_file)
      request(uri, 'application/octet-stream', image_file)
    end

    def request_image_url(uri, image_url)
      request(uri, 'application/json', {url: image_url}.to_json)
    end

    def request(uri, content_type, body)
      request = Net::HTTP::Post.new(uri.request_uri)
      request['Content-Type'] = content_type
      request['Ocp-Apim-Subscription-Key'] = @subscription_key
      request.body = body

      Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
      end
    end
  end
end
