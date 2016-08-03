require 'uri'

module MicrosoftComputerVision::Api
  class Analyze

    ENDPOINT = '/analyze'

    def initialize(visual_features, details)
      @visual_features = visual_features
      @details = details
    end

    def uri
      uri = URI("#{MicrosoftComputerVision::Client::API_BASE}#{ENDPOINT}")
      uri.query = URI.encode_www_form(params)

      uri
    end

    def params
      data = {}
      data[:visualFeatures] = @visual_features if @visual_features
      data[:details] = @details if @details

      data
    end
  end
end
