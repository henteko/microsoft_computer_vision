module MicrosoftComputerVision::Api
  class DomainModel

    ENDPOINT = '/models'

    def initialize(model)
      @model = model
    end

    def uri
      URI("#{MicrosoftComputerVision::Client::API_BASE}#{ENDPOINT}/#{@model}/analyze")
    end
  end
end
