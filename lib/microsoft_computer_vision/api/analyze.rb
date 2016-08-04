# Docs: https://dev.projectoxford.ai/docs/services/56f91f2d778daf23d8ec6739/operations/56f91f2e778daf14a499e1fa

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
      data[:visualFeatures] = @visual_features unless @visual_features.nil?
      data[:details] = @details unless @details.nil?

      data
    end
  end
end
