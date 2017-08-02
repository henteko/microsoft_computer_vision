# Docs: https://dev.projectoxford.ai/docs/services/56f91f2d778daf23d8ec6739/operations/56f91f2e778daf14a499e200

module MicrosoftComputerVision::Api
  class DomainModel

    ENDPOINT = '/models'

    def initialize(model)
      @model = model
    end

    def uri(api_base_url)
      URI("#{api_base_url}#{ENDPOINT}/#{@model}/analyze")
    end
  end
end
