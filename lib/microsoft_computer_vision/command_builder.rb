module MicrosoftComputerVision
  class CommandBuilder
    include Commander::Methods

    def get_subscription_key(options)
      key = options[:subscription_key] || ENV['SUBSCRIPTION_KEY']
      if key.nil?
        puts 'Please input your Subscription Key (--subscription_key or SUBSCRIPTION_KEY env)'
        exit
      end

      key
    end

    def run
      program :name, 'mscv'
      program :version,  MicrosoftComputerVision::VERSION
      program :description, 'Microsoft Computer Vision API for cli'

      command 'analyze' do |c|
        c.syntax = 'mscv analyze /path/to/image'
        c.description = 'Microsoft Computer Vision API Analyze'
        c.option '--subscription_key STRING', 'Microsoft Computer Vision API Subscription Key'
        c.option '--visual_features STRING', 'visualFeatures param'
        c.option '--details STRING', 'details param'
        c.action do |args, options|
          result = MicrosoftComputerVision::Client.new(get_subscription_key(options)).analyze(args.first, {
              visual_features: options[:visual_features],
              details: options[:details]
          })

          puts result.body
        end
      end

      command 'describe' do |c|
        c.syntax = 'mscv describe /path/to/image'
        c.description = 'Microsoft Computer Vision API Describe'
        c.option '--subscription_key STRING', 'Microsoft Computer Vision API Subscription Key'
        c.option '--max_candidates STRING', 'maxCandidates param'
        c.action do |args, options|
          result = MicrosoftComputerVision::Client.new(get_subscription_key(options)).describe(args.first, {
              max_candidates: options[:max_candidates]
          })

          puts result.body
        end
      end

      command 'thumbnail' do |c|
        c.syntax = 'mscv thumbnail /path/to/image'
        c.description = 'Microsoft Computer Vision API Get Thumbnail'
        c.option '--subscription_key STRING', 'Microsoft Computer Vision API Subscription Key'
        c.option '--width STRING', 'width param'
        c.option '--height STRING', 'height param'
        c.option '--smart_cropping', 'smartCropping param'
        c.action do |args, options|
          options.default smart_cropping: true
          result = MicrosoftComputerVision::Client.new(get_subscription_key(options)).thumbnail(args.first, {
              width: options[:width],
              height: options[:height],
              smart_cropping: options[:smart_cropping]
          })

          puts result.body
        end
      end

      command 'ocr' do |c|
        c.syntax = 'mscv ocr /path/to/image'
        c.description = 'Microsoft Computer Vision API OCR'
        c.option '--subscription_key STRING', 'Microsoft Computer Vision API Subscription Key'
        c.option '--language STRING', 'language param'
        c.option '--detect_orientation', 'detectOrientation param'
        c.action do |args, options|
          options.default detect_orientation: true
          result = MicrosoftComputerVision::Client.new(get_subscription_key(options)).ocr(args.first, {
              language: options[:language],
              detect_orientation: options[:detect_orientation]
          })

          puts result.body
        end
      end

      command 'model' do |c|
        c.syntax = 'mscv model /path/to/image'
        c.description = 'Microsoft Computer Vision API Domain Model'
        c.option '--subscription_key STRING', 'Microsoft Computer Vision API Subscription Key'
        c.option '--model STRING', 'model param'
        c.action do |args, options|
          result = MicrosoftComputerVision::Client.new(get_subscription_key(options)).domain_model(args.first, {
              model: options[:model]
          })

          puts result.body
        end
      end

      command 'tag' do |c|
        c.syntax = 'mscv tag /path/to/image'
        c.description = 'Microsoft Computer Vision API Tag'
        c.option '--subscription_key STRING', 'Microsoft Computer Vision API Subscription Key'
        c.action do |args, options|
          result = MicrosoftComputerVision::Client.new(get_subscription_key(options)).tag(args.first)

          puts result.body
        end
      end

      command 'models' do |c|
        c.syntax = 'mscv models'
        c.description = 'Microsoft Computer Vision API Domain Models'
        c.option '--subscription_key STRING', 'Microsoft Computer Vision API Subscription Key'
        c.action do |args, options|
          result = MicrosoftComputerVision::Client.new(get_subscription_key(options)).domain_models

          puts result.body
        end
      end

      run!
    end
  end
end
