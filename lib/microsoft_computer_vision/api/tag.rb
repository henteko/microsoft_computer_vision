require 'uri'

module MicrosoftComputerVision::Api
  class Tag

    ENDPOINT = '/tag'

    def uri
      URI("#{MicrosoftComputerVision::Client::API_BASE}#{ENDPOINT}")
    end
  end
end
