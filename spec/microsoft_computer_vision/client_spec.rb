require 'spec_helper'

RSpec.describe MicrosoftComputerVision::Client do
  let(:subscription_key) { 'subscription_key' }
  let(:image_url) { 'https://example.com/images/test.jpg' }
  let(:image_file_path) { 'test.jpg' }
  let(:image_file_data) { 'image file data' }
  let(:client) { MicrosoftComputerVision::Client.new(subscription_key) }
  let(:content_type_json) { 'application/json' }
  let(:content_type_stream) { 'application/octet-stream' }

  before do
    allow(File).to receive(:open).and_yield(StringIO.new(image_file_data))
  end

  context 'analyze' do
    it 'When image url' do
      stub_request(:post, 'https://api.projectoxford.ai/vision/v1.0/analyze').
          with(body: {url:image_url},
               headers: {'Content-Type': content_type_json, 'Ocp-Apim-Subscription-Key': subscription_key})

      client.analyze(image_url, {})
    end

    it 'When image file path' do
      stub_request(:post, 'https://api.projectoxford.ai/vision/v1.0/analyze').
          with(body: image_file_data,
               headers: {'Content-Type': content_type_stream, 'Ocp-Apim-Subscription-Key': subscription_key})

      client.analyze(image_file_path, {})
    end

    it 'When options' do
      visual_features = 'visualFeatures'
      details = 'details'
      stub_request(:post, "https://api.projectoxford.ai/vision/v1.0/analyze?visualFeatures=#{visual_features}&details=#{details}").
          with(body: {url:image_url},
               headers: {'Content-Type': content_type_json, 'Ocp-Apim-Subscription-Key': subscription_key})

      client.analyze(image_url, {visual_features: visual_features, details: details})
    end
  end

  context 'describe' do
    it 'When image url' do
      stub_request(:post, 'https://api.projectoxford.ai/vision/v1.0/describe').
          with(body: {url:image_url},
               headers: {'Content-Type': content_type_json, 'Ocp-Apim-Subscription-Key': subscription_key})

      client.describe(image_url, {})
    end

    it 'When image file path' do
      stub_request(:post, 'https://api.projectoxford.ai/vision/v1.0/describe').
          with(body: image_file_data,
               headers: {'Content-Type': content_type_stream, 'Ocp-Apim-Subscription-Key': subscription_key})

      client.describe(image_file_path, {})
    end

    it 'When options' do
      max_candidates = '1'
      stub_request(:post, "https://api.projectoxford.ai/vision/v1.0/describe?maxCandidates=#{max_candidates}").
          with(body: {url:image_url},
               headers: {'Content-Type': content_type_json, 'Ocp-Apim-Subscription-Key': subscription_key})

      client.describe(image_url, {max_candidates: max_candidates})
    end
  end

  context 'thumbnail' do
    it 'When image url' do
      stub_request(:post, 'https://api.projectoxford.ai/vision/v1.0/generateThumbnail').
          with(body: {url:image_url},
               headers: {'Content-Type': content_type_json, 'Ocp-Apim-Subscription-Key': subscription_key})

      client.thumbnail(image_url, {})
    end

    it 'When image file path' do
      stub_request(:post, 'https://api.projectoxford.ai/vision/v1.0/generateThumbnail').
          with(body: image_file_data,
               headers: {'Content-Type': content_type_stream, 'Ocp-Apim-Subscription-Key': subscription_key})

      client.thumbnail(image_file_path, {})
    end

    it 'When options' do
      width = 400
      height = 400
      smart_cropping = false
      stub_request(:post, "https://api.projectoxford.ai/vision/v1.0/generateThumbnail?width=#{width}&height=#{height}&smartCropping=#{smart_cropping}").
          with(body: {url:image_url},
               headers: {'Content-Type': content_type_json, 'Ocp-Apim-Subscription-Key': subscription_key})

      client.thumbnail(image_url, {width: width, height: height, smart_cropping: smart_cropping})
    end
  end

  context 'ocr' do
    it 'When image url' do
      stub_request(:post, 'https://api.projectoxford.ai/vision/v1.0/ocr').
          with(body: {url:image_url},
               headers: {'Content-Type': content_type_json, 'Ocp-Apim-Subscription-Key': subscription_key})

      client.ocr(image_url, {})
    end

    it 'When image file path' do
      stub_request(:post, 'https://api.projectoxford.ai/vision/v1.0/ocr').
          with(body: image_file_data,
               headers: {'Content-Type': content_type_stream, 'Ocp-Apim-Subscription-Key': subscription_key})

      client.ocr(image_file_path, {})
    end

    it 'When options' do
      language = 'ja'
      detect_orientation = false
      stub_request(:post, "https://api.projectoxford.ai/vision/v1.0/ocr?language=#{language}&detectOrientation=#{detect_orientation}").
          with(body: {url:image_url},
               headers: {'Content-Type': content_type_json, 'Ocp-Apim-Subscription-Key': subscription_key})

      client.ocr(image_url, {language: language, detect_orientation: detect_orientation})
    end
  end

  context 'domain_model' do
    let(:model) { 'model' }

    it 'When image url' do
      stub_request(:post, "https://api.projectoxford.ai/vision/v1.0/models/#{model}/analyze").
          with(body: {url:image_url},
               headers: {'Content-Type': content_type_json, 'Ocp-Apim-Subscription-Key': subscription_key})

      client.domain_model(image_url, {model: model})
    end

    it 'When image file path' do
      stub_request(:post, "https://api.projectoxford.ai/vision/v1.0/models/#{model}/analyze").
          with(body: image_file_data,
               headers: {'Content-Type': content_type_stream, 'Ocp-Apim-Subscription-Key': subscription_key})

      client.domain_model(image_file_path, {model: model})
    end
  end

  context 'tag' do
    let(:model) { 'model' }

    it 'When image url' do
      stub_request(:post, 'https://api.projectoxford.ai/vision/v1.0/tag').
          with(body: {url:image_url},
               headers: {'Content-Type': content_type_json, 'Ocp-Apim-Subscription-Key': subscription_key})

      client.tag(image_url)
    end

    it 'When image file path' do
      stub_request(:post, 'https://api.projectoxford.ai/vision/v1.0/tag').
          with(body: image_file_data,
               headers: {'Content-Type': content_type_stream, 'Ocp-Apim-Subscription-Key': subscription_key})

      client.tag(image_file_path)
    end
  end

  context 'domain_models' do
    it 'When image url' do
      stub_request(:get, 'https://api.projectoxford.ai/vision/v1.0/models').
          with(headers: {'Ocp-Apim-Subscription-Key': subscription_key})

      client.domain_models
    end

    it 'When image file path' do
      stub_request(:get, 'https://api.projectoxford.ai/vision/v1.0/models').
          with(headers: {'Ocp-Apim-Subscription-Key': subscription_key})

      client.domain_models
    end
  end
end
