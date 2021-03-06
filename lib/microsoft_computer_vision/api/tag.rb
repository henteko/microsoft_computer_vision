# Docs: https://dev.projectoxford.ai/docs/services/56f91f2d778daf23d8ec6739/operations/56f91f2e778daf14a499e1ff

module MicrosoftComputerVision::Api
  class Tag

    ENDPOINT = '/tag'

    def uri(api_base_url)
      URI("#{api_base_url}#{ENDPOINT}")
    end
  end
end
