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
options = {
  visual_features: 'Faces',
  details: 'Celebrities'
}

res = client.analyze_image_url('http://example.com/images/test.jpg', options)
puts res.body
```

Please see [example](https://github.com/henteko/microsoft_computer_vision/tree/master/example).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/henteko/microsoft_computer_vision.


## License

[MIT License](http://www.opensource.org/licenses/MIT)
