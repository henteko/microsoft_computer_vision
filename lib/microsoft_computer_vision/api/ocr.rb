require 'uri'

module MicrosoftComputerVision::Api
  class OCR

    ENDPOINT = '/ocr'

    def initialize(language, detect_orientation)
      @language = language
      @detect_orientation = detect_orientation
    end

    def uri
      uri = URI("#{MicrosoftComputerVision::Client::API_BASE}#{ENDPOINT}")
      uri.query = URI.encode_www_form(params)

      uri
    end

    def params
      data = {}
      data[:language] = @language if @language
      data[:detectOrientation] = @detect_orientation if @detect_orientation

      data
    end
  end
end
