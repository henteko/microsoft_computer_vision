# Microsoft Computer Vision API

[![Gem Version](https://badge.fury.io/rb/microsoft_computer_vision.svg)](https://badge.fury.io/rb/microsoft_computer_vision)
[![Build Status](https://travis-ci.org/henteko/microsoft_computer_vision.svg?branch=master)](https://travis-ci.org/henteko/microsoft_computer_vision)

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

res = client.analyze('http://example.com/images/test.jpg', options)
puts res.body
```

Please see [example](https://github.com/henteko/microsoft_computer_vision/tree/master/example).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/henteko/microsoft_computer_vision.


## License

[MIT License](http://www.opensource.org/licenses/MIT)
