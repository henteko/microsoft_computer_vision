module MicrosoftComputerVision::Api
  class DomainModels

    ENDPOINT = '/models'

    def uri
      URI("#{MicrosoftComputerVision::Client::API_BASE}#{ENDPOINT}")
    end
  end
end
