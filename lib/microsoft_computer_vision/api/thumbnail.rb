# Docs: https://dev.projectoxford.ai/docs/services/56f91f2d778daf23d8ec6739/operations/56f91f2e778daf14a499e1fb

module MicrosoftComputerVision::Api
  class Thumbnail

    ENDPOINT = '/generateThumbnail'

    def initialize(width, height, smart_cropping)
      @width = width
      @height = height
      @smart_cropping = smart_cropping
    end

    def uri
      uri = URI("#{MicrosoftComputerVision::Client::API_BASE}#{ENDPOINT}")
      uri.query = URI.encode_www_form(params)

      uri
    end

    def params
      data = {}
      data[:width] = @width unless @width.nil?
      data[:height] = @height unless @height.nil?
      data[:smartCropping] = @smart_cropping unless @smart_cropping.nil?

      data
    end
  end
end
