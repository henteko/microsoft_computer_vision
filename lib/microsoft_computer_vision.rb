require 'uri'
require 'net/http'
require 'json'
require 'commander'

module MicrosoftComputerVision
end

require 'microsoft_computer_vision/version'
require 'microsoft_computer_vision/client'
require 'microsoft_computer_vision/api/analyze'
require 'microsoft_computer_vision/api/describe'
require 'microsoft_computer_vision/api/thumbnail'
require 'microsoft_computer_vision/api/domain_model'
require 'microsoft_computer_vision/api/domain_models'
require 'microsoft_computer_vision/api/ocr'
require 'microsoft_computer_vision/api/tag'
require 'microsoft_computer_vision/command_builder'
