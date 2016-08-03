require 'net/http'
require 'json'

module MicrosoftComputerVision
  class Client

    API_BASE = 'https://api.projectoxford.ai/vision/v1.0'

    def initialize(subscription_key)
      @subscription_key = subscription_key
    end

    ###############################################################################################################
    # Analyze
    # Docs: https://dev.projectoxford.ai/docs/services/56f91f2d778daf23d8ec6739/operations/56f91f2e778daf14a499e1fa
    ###############################################################################################################

    def analyze_image_url(image_url, options)
      analyze = Api::Analyze.new(options[:visual_features], options[:details])
      post_image_url(analyze.uri, image_url)
    end

    def analyze_image_file(image_file, options)
      analyze = Api::Analyze.new(options[:visual_features], options[:details])
      post_image_file(analyze.uri, image_file)
    end

    ###############################################################################################################
    # Describe
    # Docs: https://dev.projectoxford.ai/docs/services/56f91f2d778daf23d8ec6739/operations/56f91f2e778daf14a499e1fe
    ###############################################################################################################

    def describe_image_url(image_url, options)
      describe = Api::Describe.new(options[:max_candidates])
      post_image_url(describe.uri, image_url)
    end

    def describe_image_file(image_file, options)
      describe = Api::Describe.new(options[:max_candidates])
      post_image_file(describe.uri, image_file)
    end

    ###############################################################################################################
    # Thumbnail
    # Docs: https://dev.projectoxford.ai/docs/services/56f91f2d778daf23d8ec6739/operations/56f91f2e778daf14a499e1fb
    ###############################################################################################################

    def thumbnail_image_url(image_url, options)
      thumbnail = Api::Thumbnail.new(options[:width], options[:height], options[:smart_cropping])
      post_image_url(thumbnail.uri, image_url)
    end

    def thumbnail_image_file(image_file, options)
      thumbnail = Api::Thumbnail.new(options[:width], options[:height], options[:smart_cropping])
      post_image_file(thumbnail.uri, image_file)
    end

    ###############################################################################################################
    # TODO: Domain Models
    # Docs: https://dev.projectoxford.ai/docs/services/56f91f2d778daf23d8ec6739/operations/56f91f2e778daf14a499e1fd
    #       https://dev.projectoxford.ai/docs/services/56f91f2d778daf23d8ec6739/operations/56f91f2e778daf14a499e200
    ###############################################################################################################

    ###############################################################################################################
    # OCR
    # Docs: https://dev.projectoxford.ai/docs/services/56f91f2d778daf23d8ec6739/operations/56f91f2e778daf14a499e1fc
    ###############################################################################################################

    def ocr_image_url(image_url, options)
      ocr = Api::OCR.new(options[:language], options[:detect_orientation])
      post_image_url(ocr.uri, image_url)
    end

    def ocr_image_file(image_file, options)
      ocr = Api::OCR.new(options[:language], options[:detect_orientation])
      post_image_file(ocr.uri, image_file)
    end

    ###############################################################################################################
    # Tag
    # Docs: https://dev.projectoxford.ai/docs/services/56f91f2d778daf23d8ec6739/operations/56f91f2e778daf14a499e1ff
    ###############################################################################################################

    def tag_image_url(image_url)
      tag = Api::Tag.new()
      post_image_url(tag.uri, image_url)
    end

    def tag_image_file(image_file)
      tag = Api::Tag.new()
      post_image_file(tag.uri, image_file)
    end

    private

    def post_image_file(uri, image_file)
      post(uri, 'application/octet-stream', image_file)
    end

    def post_image_url(uri, image_url)
      post(uri, 'application/json', {url: image_url}.to_json)
    end

    def post(uri, content_type, body)
      request = Net::HTTP::Post.new(uri.request_uri)
      request['Content-Type'] = content_type
      request['Ocp-Apim-Subscription-Key'] = @subscription_key
      request.body = body

      Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
      end
    end
  end
end
