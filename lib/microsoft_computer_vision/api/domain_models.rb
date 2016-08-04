# Docs: https://dev.projectoxford.ai/docs/services/56f91f2d778daf23d8ec6739/operations/56f91f2e778daf14a499e1fd

module MicrosoftComputerVision::Api
  class DomainModels

    ENDPOINT = '/models'

    def uri
      URI("#{MicrosoftComputerVision::Client::API_BASE}#{ENDPOINT}")
    end
  end
end
