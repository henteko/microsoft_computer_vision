module MicrosoftComputerVision::Api
  class Describe

    ENDPOINT = '/describe'

    def initialize(max_candidates)
      @max_candidates = max_candidates
    end

    def uri
      uri = URI("#{MicrosoftComputerVision::Client::API_BASE}#{ENDPOINT}")
      uri.query = URI.encode_www_form(params)

      uri
    end

    def params
      data = {}
      data[:maxCandidates] = @max_candidates if @max_candidates

      data
    end
  end
end
