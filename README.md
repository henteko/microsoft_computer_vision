# Microsoft Computer Vision API

This is a very basic wrapper for the [Microsoft Computer Vision API](https://www.microsoft.com/cognitive-services/en-us/computer-vision-api).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'microsoft_computer_vision'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install microsoft_computer_vision 
```
    
## Usage

```ruby
require 'microsoft_computer_vision'

client = MicrosoftComputerVision::Client.new('your_subscription_key')

res = client.analyze({
  visual_features: 'visualFeatures', # optional
  details: 'details', # optional
  image_url: 'imageURL'
})

puts res.description
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/henteko/microsoft_computer_vision.


## License

[MIT License](http://www.opensource.org/licenses/MIT)
