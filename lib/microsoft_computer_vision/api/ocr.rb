# Docs: https://dev.projectoxford.ai/docs/services/56f91f2d778daf23d8ec6739/operations/56f91f2e778daf14a499e1fc

module MicrosoftComputerVision::Api
  class OCR

    ENDPOINT = '/ocr'

    def initialize(language, detect_orientation)
      @language = language
      @detect_orientation = detect_orientation
    end

    def uri(api_base_url)
      uri = URI("#{api_base_url}#{ENDPOINT}")
      uri.query = URI.encode_www_form(params)

      uri
    end

    def params
      data = {}
      data[:language] = @language unless @language.nil?
      data[:detectOrientation] = @detect_orientation unless @detect_orientation.nil?

      data
    end
  end
end
