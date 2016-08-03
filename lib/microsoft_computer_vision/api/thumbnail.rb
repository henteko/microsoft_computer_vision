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
      data[:width] = @width if @width
      data[:height] = @height if @height
      data[:smartCropping] = @smart_cropping if @smart_cropping

      data
    end
  end
end
